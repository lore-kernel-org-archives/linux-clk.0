Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB22857EA
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155534; cv=none; b=q2apj/iEpZV03GR+6BDQpwFZOCiYL4c80h9yRpYUSMDYiqpSuWXkXFGzEJZC74jA98AxggpaIQaUPGOREZ6WXMt5rjOUhRH22xC52s1dySfzBBc8fKaZna9h+7ZtV++k+eSpbrQK3Pp9jL7OKANHIKJwR/JdRScmxjrJUplK4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155534; c=relaxed/simple;
	bh=QEW3lhhJANPdrCVBmAIqH1dXUDPD23689ylzZ5dnJco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcaLAKp2yML7RyHy53NIbYgDkjJkcqu2c7pPN/jRg75lTaYn8CQk+X/aDLHYsX934KgdNhmJH4Fe2w9o2efDGfROA1afA8w3/BViPWSH5LqAbmC2eWisv2Dnmh4gKttPzIg1Cb6SxAv6mVZSXELv4LHxtxDuq9XFuA10nPBp/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899a9f445cbso158418206d6.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155532; x=1773760332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru18n38/qbgrYN5XhGLEd0K3IukQ/mw6D37X8x0z/qo=;
        b=xGVgRdT3soZeJ2AsALlQwzD+iZnM1HB9zUajtBZO/vZRa64B989E/VTQSF9RlHM1Pb
         HuToGMF34aT7gtC3tlXMWO7rjAmpI8ROE3/Cv2ggbSndcg6yEBeg6BAqhytEqhk96rYi
         TJame4xjGlVRjKia7OmSCLYF/rYuN/XjO1PkqSjK0E/bNBnlvrPI+ElEPTKMsyYbf2XJ
         3jUmLmcawgAnuRvku2w82zO6cVogzO6QIW3lRU6TvO51CDles+E4rPc89vx2JLK0cNQI
         CZIQ8plE1tiU6PF7DxPNyH8O5jFjRvpnuv8LkrFmZcz3ZX+w32CwHgFNBlwZ8Asspgj1
         UMGw==
X-Forwarded-Encrypted: i=1; AJvYcCX69kbMFoFY/LoNM2nO4q6tXTooCkpTSpmqiOuUFgi5SPO0ic+FGfhk56/iaAOa+c+nO/A8m1Bz6yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVMWrSOsVehe3hF44fCoRhgIhCYpQIMNvuvEFmO6SJ2hzr6y/
	Ucy0J6LvqBATeXMZls+SEweohwxEYi/0NAvUxYnYTw6Zy1UGm3eGT8IYk3DFyYZD
X-Gm-Gg: ATEYQzxhT2h8QRpkro53gMcuJjuvA1D72IjF3LhNsk/FHH+MlIv/zdhNpgS9KgUjwmB
	zij+KdRYgdPEmdosWkDaeFiXACaXnyYfz3XFs7rUItoilYgJ0vVrQxmXmmkRS1VbQ1F4qojwfmr
	TnBCFyQmqmoSrKhL0PPIVR8XPw4Cx9W7KLh6KXYuc/CzVHDmMfhfnIEy2NrMpx5/ptkxO1k7pJo
	U1DRArLOddtiBKYiEWrbocUxws2GgJHgaHAnTpc9GlDgFRwSCrsrNazPURUYAHxBYYGs9yTdlwt
	3lYTRvce0oJnem4M0T8C0qmU9WV1z7L9Rp0hm00RMjrIxfwec1h1UjbE696oVpDBQoRCYrT8wyq
	4fsGlygWccnjKAXrHIJSZ3/qnsL0NyiY4SSIZot33DtmNREKjxIbWDGfCfkfJU6scyQcj+EJ75X
	tSpa8o78CLwQLywuFEP0IZpWArraE9VYEVtTaHz7TDFoiGrDWbKXSxXbRyFOV4c9Q8RAmF89o=
X-Received: by 2002:ad4:5d41:0:b0:89a:d41:b1c3 with SMTP id 6a1803df08f44-89a30b00af7mr226502906d6.50.1773155531831;
        Tue, 10 Mar 2026 08:12:11 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a1817dsm20078926d6.4.2026.03.10.08.12.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:12:11 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899fc265126so123450496d6.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 08:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLSrl64MASqBE/AoAKSiswScO07bOfEBJg8ZKpp2GeVCYgtmz/yfKiK1G1l9DlhsaO7L8zXkZn6uo=@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:5f1:70fe:3027 with SMTP id
 ada2fe7eead31-5ffe6121c90mr5181206137.24.1773155033187; Tue, 10 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-3-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
X-Gm-Features: AaiRm53b7liJL7XJhyMA-JPl81LkjhC0Orfn04kAcG7__Cf3-wDY5cIOlphhcC4
Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> wrote=
:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

FTR, one more user of get_dev_from_fwnode() appeared in commit
9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
in reset/next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
