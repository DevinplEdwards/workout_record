document.addEventListener "DOMContentLoaded", ->
    editActivityBtns = document.querySelectorAll(".edit-activity-btn")
    editActivityBtns.forEach (btn) ->
        btn.addEventListener "click", ->
            exerciseId = btn.dataset.exerciseId
            exerciseRow = btn.closest("tr")
            activityCell = exerciseRow.querySelector(".activity-cell")

        editForm = document.createElement("div")
        editForm.innerHTML = '<%= escape_javascript(render partial: "form", locals: { exercise: exercise }) %>'

        activityCell.innerHTML = ""
        activityCell.appendChild(editForm)
