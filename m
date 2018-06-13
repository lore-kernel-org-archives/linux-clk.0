Return-Path: <srinath.mannam@broadcom.com>
MIME-Version: 1.0
From: Srinath Mannam <srinath.mannam@broadcom.com>
Date: Wed, 13 Jun 2018 09:44:45 +0530
Message-ID: <CABe79T6zQ_7Ycws5b=xaQ3edpVn1QPQyWd9p24eqLGpYbdtt0A@mail.gmail.com>
Subject: ACPI support in common clock framework
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Michael, Stephen,

We are adding ACPI support in our Linux based platform.
At present our clock hierarchy using common clock framework through DTS.
Now we required ACPI support in common clock framework to upgrade our platform.

For example, clk_get API called in many drivers to get clock device is
tightly coupled with DT framework.

Please let us know, if anybody in Open Source community have plans to
add ACPI support for common clock framework.
If not please suggest us alternative method to use common clock
framework in ACPI use case.

Thanks in advance.

Regards,
Srinath.
