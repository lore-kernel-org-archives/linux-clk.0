Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5F18FDC2
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526079; cv=none; b=O9JD8+ij2vemdEJfUA0ZCJJcLRLziVdM6izUcoKtbHB26pl0h9h4GCfj0wnxZLwsWxFEgcUVLaHi19lF5p4BuHkJfUzW9h1V4jNQu5mALTPA7dtVAkNKN7YpbStYOJYMQCoXpToAj1/1XOTMfyiFC7LyZDFDrVENWBBZuf8bLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526079; c=relaxed/simple;
	bh=Z8jQntIYUuDqbpeg8tuOdkkbLTKTkbcIxwmwmqoh6r4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCA7v830+vOqcrKRZVbd7IWjMi77UZQuB/Y81X9OcWqJqXcGGD9HjcxBBF4ADM/iL5+aR+y5r9cZ54ClHIA4o3z4KZEWcNFfz3u+SCElTFy5ayEnp0FrjgdATDyzNlWrwX+fAv9gGBZ9rLIGqydex2SBlQUASE75PVtLZroMZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=egyou7Fb; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="egyou7Fb"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4630775e87.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732526074; x=1733130874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4toVw0A5ZDZA3zYjFx66d73EEMSNS7vgXv0fs9opgvU=;
        b=egyou7FbZgoU65bgdaRjf1eCy/5jmzFx13LzbEqle316n8PfA/yMdqI6isae75c9EA
         xXunXPa91zFfjxs8TvCxv7s/RrKGDYz8kT+Mu4PJN1Ginx2/YsHVSba9kVN+lofpDXMl
         tM2lBwdu2Fv+yZHnqLIrLGVKq2WgECP4dHz70Xtr7L4Tn79gZZdrFq/XkxtgNZU8ezuf
         eVeEbj4RQS6ASlsj4jnYkWxAoeIrUuXbjCo7ZyfL7BVGlZvamjJdrjxwongjYy4QeJVo
         f6CnBcG2KbCsUhCSVMGPI426DxSUC22xW0ArYV14V1DD9XTc1yPDsIHHTSOi8BYkXBY5
         fxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526074; x=1733130874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4toVw0A5ZDZA3zYjFx66d73EEMSNS7vgXv0fs9opgvU=;
        b=o3fp+3jAwXEjFB2D1vaj7JTuG3fm869j+bwz1HK0bvuLsHQvhNn6MDONauNWRQM9x7
         1t3AOpBTGeWUOfBAmlgcdXs2XaLC3onQ8aQ8c28nHulBfp6yJ5tlnYlGTQWwOJfTR3Al
         kGfzHxaIiOrZ8sYwMAY8P7N7M/NycOJf7kE7hGe8b0cBkH/CI2VGC1ZgqkgpyiAwv4IS
         FRVr66lys9mqf58UoRBo8V9vUwa15OKcmk3gPv1pE828jV6dcvUNGbHHwgQtS66l+9TC
         1dzzATNiXKLS8xFnkPNR7RrfMfYQlaEjMdeNIRzAata55pWqFk7ZVrl5QZiQ2q8CrLiC
         NAdg==
X-Forwarded-Encrypted: i=1; AJvYcCW09w9c8Z9A3F3W1NawFXJ9Yq+E2wPgWysfDYB9kOV6yshsYaqmHhfipP7wykkAmYgPn4/IGg9OD+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJFscP9kobok4DPWzvPfygWvQe6ARgcyQ3GVrVuLiCQtqxutO
	U1x8vRbp8Lm/UYoZiqkA6XGYbTfRjUJY1pOChJVgISRKn4DPtfpkJ71MzWuseL4=
X-Gm-Gg: ASbGncuW6EbQziYvWspQhy6d3bP2XVj1vnaLQf+PPmdUpqN9C5D8JCCqxAtCah6+DyC
	f9G7Ny0jXC56b6/eWa8Mp5RN0IclPrZ9NzWf3IGa/Iu3dOyV29W4XzLbVQdXQU5geuivVUBbou9
	YTKWbIInz68xsWXp5LprmE3yfxHKKOj0Vb/d4s/Wp7ejO3AbwH57wAtGNGE1ZOJNaoWFRRL1S+p
	1qon7zE6ckZ04UFYCqjCuWfYmn2L++5lCltkJGLsmBaDeMLP97ylW1BiiTA/R2CwL/Xsr6l8H8a
	wzBxSFS9WMeCH/BlaYPy
X-Google-Smtp-Source: AGHT+IGzMekzBQYfXvbzxD9izRI1CL/rjOOOx/NwOujkSDTMSARyoXxxyDmvBO3p/5f/oLabAnZ/QA==
X-Received: by 2002:ac2:4e0c:0:b0:53d:dc0e:4da0 with SMTP id 2adb3069b0e04-53ddc0e56e9mr2499509e87.15.1732526074368;
        Mon, 25 Nov 2024 01:14:34 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa524615e8fsm363089966b.182.2024.11.25.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 01:14:34 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 25 Nov 2024 10:15:06 +0100
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@amd.com>, linux-gpio@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	Derek Kiernan <derek.kiernan@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Wilczynski <kw@linux.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <Z0RAGkBc-yz5lqN6@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
 <173250040873.6640.9720381303445148722.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173250040873.6640.9720381303445148722.robh@kernel.org>

Hi Rob,

On 20:06 Sun 24 Nov     , Rob Herring (Arm) wrote:
> 
> On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > schema is intended as minimal support for the clock generator and
> > gpio controller peripherals which are accessible through BAR1.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Sorry about that, but even if I see that this should be the case (I've dropped
the clock-name property from raspberrypi,rp1-clock.yaml), I can't reproduce it
with:

# make W=1 dt_binding_check DT_SCHEMA_FILES=pci1de4,1.yaml

and the output is:

  CHKDT   Documentation/devicetree/bindings
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/misc/pci1de4,1.example.dts
  DTC [C] Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb

dt-schema seems up to date. Is my command line correct?

Many thanks,
Andrea

