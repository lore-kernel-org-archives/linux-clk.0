Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7259A3ACA4A
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190383; cv=none; b=uiC6QzeYGPixhMjM4iRRiclpf2MV58wtCpg4yngXj3ROLdgAq0WTL7Gfr1yoIs6NQt4dGcvswtxICsrDqz+IoR2VCKJcyudgl8bqTHDl7d7qZ+JWcNHkvIvNneojn6KPjLQglQ7ZWXyq9WZrOLhEG4o03W7dApNIX4Z2QAafWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190383; c=relaxed/simple;
	bh=Xt8T2LYzOXOEoVBpymcZc2eRgsOEoxFq4GkPu2abpQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRV9lWNO66VBmgFfpEgap8+Tsu3yK9QVOXBZlIE2zErld3FcJq4lqLNbYP7sdLrtP/G8Crz2XcUJoH+AFHj7MH9K4oenP5+libReazLGymdQKCKLi1kHQmTHdmagNieOjl7h1HNn9xNPhkOAiu9EGVVrPvSfRy/QO4loHtAxzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94dd687e040so405138241.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 03:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190381; x=1772795181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE98lzQphAGWmhBl2muiZY2HaF/hBooDn284eHmY7ZY=;
        b=gKNQdot7jSHuzeSxhLd53gbO8lxq1iskz6FWRy2N3TRRa0snSx9Ip5Y/+s8ulS6154
         ntP8jinKDvmKKvh4mJZr7zmS5FB1QU2I2pKGzyENLbX+cIKhmW7O1gfuLmAtv5s2S5pM
         W1dPQxd50KBuzEKACZ/sKWkpr9oBAbI7uajPwFlYlpxsn/gE/oNH8WXslRqaqUJTKRom
         K9yxW7IcHAftek8Ar3Fimfu9aQHJFjx99AFTg0hXMLCPof3DoJ2EPrq6xM0PF5ah5f/a
         ZSI4uZ+RGgDYQvykjLa1SMkZP3RS2I1mrbicl+QUJC+VPj1lMPnptvkv8Jyi4/5G6+Ou
         Rkpg==
X-Forwarded-Encrypted: i=1; AJvYcCVakcIHZHkr8kIKoHNvJUNCwUwEES82etaHWCewAJfzmRoOT/E+EZv1nVsK/FS8jC35M7ozEBbbVTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqO5Wpt4aV+NQmS/svikE0FQ1xUXpuCkyfRd3UBATg2PY7zkbN
	28gPWWbEN66qNRB4i8NnWwzMQ1voYpnpXrPLw8kRBmS4DMMQSFQ/L/wgAjz7Q6y8U5Q=
X-Gm-Gg: ATEYQzxHVxwvv0Z5s8XgDqo3vbhaWYk+3cGaUOE0SoEf3nmeUeIM1Aw8fpb/MFW17AM
	Wtro9K5yiZfCQ0EfmKU287VuLdNeM6NG6rDiDMlpiL+u7mVRag7/jnx2O4UFd1E3/CWuPMtgv0a
	ws184fJyWZcu+EZ2Xi354LOgmciNLjjhB2YD/bOOKffDNCwRg4zwP7yjG0GlwNKlF+iB/Uyvasr
	rLfwG1C1FvBV+s1p4lEG5lsu+mGMAeazphgzLzy9o7DF++ZlE6eUby3/QgFK+Z1wNRNqBL6ktX3
	OT2pYEJ3ra/Pg6N/8krpqgIFgrJAW+KsxMxiJrMfamkA6xL18D3HKyUschFooVNNDWq7nGrbJG8
	Z0IY9vJ+8eGVxLBGSJ04UHAtjVwEO47TCN4lab0G2d40C20mhXyKE2UqG19upRCVf+/En6wq7/v
	tOffsOcsMLFwIdrN1f/l3WbclMpo+S58TnM06SQ99I55fP4UkV0anPOW/cG6q4
X-Received: by 2002:a05:6102:94a:b0:5fe:c4aa:10d6 with SMTP id ada2fe7eead31-5ff3253a4c8mr1190929137.34.1772190381486;
        Fri, 27 Feb 2026 03:06:21 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e808164sm4949932137.4.2026.02.27.03.06.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:06:20 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94dd687e040so405132241.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 03:06:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnxXk87MSpv4/CDrL1od2bWukmR6p12oyInM1QA2MSbrE6HCsJvLEnC4UKo+vXQRR7o2WlAHTYQOA=@vger.kernel.org
X-Received: by 2002:a05:6102:3706:b0:5fe:af0c:79ff with SMTP id
 ada2fe7eead31-5ff324c037cmr877780137.19.1772190379919; Fri, 27 Feb 2026
 03:06:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com> <20260203135139.28151-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260203135139.28151-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 12:06:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4HvawRF1bc=Mu-QvPFpfLMKq8g80-XQxFgOnJYR2kNg@mail.gmail.com>
X-Gm-Features: AaiRm52nImXCDA3sCOv8r6ic4zHbeM7lAITmoRTYT0g3eih1AUtSRh5Hi90xueA
Message-ID: <CAMuHMdW4HvawRF1bc=Mu-QvPFpfLMKq8g80-XQxFgOnJYR2kNg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] clk: versaclock3: Prefix clock names with DT node name
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Tue, 3 Feb 2026 at 14:52, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Similar to commit f491276a5168 ("clk: vc5: Allow Versaclock driver to
> support multiple instances"), prefix clock names with the device tree
> node name to allow multiple VersaClock3 devices to be registered
> simultaneously.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -1137,6 +1137,7 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
>         struct device *dev = &vc3->client->dev;
>         struct clk_parent_data *pd;
>         struct clk_init_data init;
> +       const char *name;
>         int ret;
>
>         if (!hw_data->data)
> @@ -1147,7 +1148,15 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
>         if (!pd)
>                 return -ENOMEM;
>
> +       name = kasprintf(GFP_KERNEL, "%pOFn.%s", dev->of_node,
> +                        template->hw.init->name);

"%pOFn" is still not unique.  As per the Generic Names Recommendation
in the Devicetree Specification, it should be "clock-controller"
everywhere.  Using the I2C device name instead should work fine.
The same issue is present in the Versaclock 5 driver (but
e.g. beacon-renesom-som.dtsi uses "versaclock-som").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
