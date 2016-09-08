Return-Path: <martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <m260q6jibf.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com> <m260q6jibf.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Sep 2016 21:52:45 +0200
Message-ID: <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
To: Kevin Hilman <khilman@baylibre.com>
Cc: kishon@ti.com, linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
	johnyoun@synopsys.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com,
	will.deacon@arm.com, catalin.marinas@arm.com, gregkh@linuxfoundation.org,
	mark.rutland@arm.com, robh+dt@kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 8, 2016 at 9:35 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> +     phy = devm_phy_create(&pdev->dev, NULL, &phy_meson_usb2_ops);
>> +     if (IS_ERR(phy)) {
>> +             dev_err(&pdev->dev, "failed to create PHY\n");
>> +             return PTR_ERR(phy);
>> +     }
>> +
>> +     if (usb_reset_refcnt++ == 0) {
>> +             ret = device_reset(&pdev->dev);
>> +             if (ret) {
>> +                     dev_err(&phy->dev, "Failed to reset USB PHY\n");
>> +                     return ret;
>> +             }
>> +     }
>
> The ref count + reset here looks like something that could/should be
> handled in a runtime PM callback.
Unfortunately that doesn't work (as Jerome found out) because both
PHYs are sharing the same reset line.
So if the second PHY would call device_reset then it would also reset
the first PHY!

There's a comment above the declaration of usb_reset_refcnt which
tries to explain this:
"The PHYs are sharing a common reset line -> we are only allowed to
reset once for all PHYs."
Maybe I should move this comment to the "if (usb_reset_refcnt++ == 0)
{" line to make it easier to see?


Regards,
Martin
