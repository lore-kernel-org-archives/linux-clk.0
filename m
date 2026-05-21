Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD63546E6
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351753; cv=none; b=GLx9234a6yMuQicPgZAwufEoyhJztCzbvSu0dmuf/it795qEWWDeuSuHnV3F5CIoTY+rx9yEcIpS59d75V6qZX2QA35fiIJAN5kgWjdHdwV3MoSyD9w3IReCUD9JaZKnoQvupQtjVPd2TVHsyAAaXgbUrEzdyKpOCj/OjhcpZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351753; c=relaxed/simple;
	bh=2U4Iz+y/ftIEQD2G9GHkxV5IQLWcE2W5F9DA9bvujfE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3GzOKJKR/JLmDzsOvtMN7fUH/1rwksv2mAVxn/5S0Kf7sbAboonuwUwQnAZ+b5JRdfFPVRlwwE9r67Nke7EOJYzUuzB7shyV/ur6wVY4hbjieeBrjlGLm0jqPYS0/78aH3Cir3evW2zFhKl0Sg3DIRgRT52CChy53jz7BeNCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1RPX4Tr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1RPX4Tr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so49904455e9.1
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779351751; x=1779956551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=Y1RPX4TrHsw4GfhL/hlzBc7o0EBKZ404MMtMm9nl9sKh2faf3YcHRDm5/fXHxjSYvA
         ORz13F6JG1EraOGiT/j3w89DwyrifOeytE2R2aHu4JMHRzbGtmLAm6Ql4nkI2ZVD9hOy
         WPMoiqbRqlmT2D4vP/z0PpAgH/6zOS00Clg5N8D7f1ISkR2DHeth9KRS9yjU/NFmFC8T
         xfY293wXAVSvGX73fkj+UHxQ9Zjsz+Vc9++YiAkcB3xx/CX5B8/WC5cdRq5syopbcRh/
         ggYm+v6uy+DDsNu1wwRopoIdyY3AnbDIJPHubn9aD7PAnkdkE4tZV+D8Jpst0DyyTBF6
         CA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351751; x=1779956551;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCcyB5LFRmVcSIROxmyKJG5EejU8FPAzcsI/5iDjdGU=;
        b=s/LE8gE8iGVURJH3NavMEpgCZ32bo4K8P3SWP2ncaArOJ5+dOc/GocK6Tng0CADuDH
         uELLYHuBOxV1yS+mCk2dIe3YWbFZXN0IYXVpP6WCDuT4WC3v5mORbcY+vWt6FkhB5BTW
         /GiSNo5OeBpmgnNPdZLAIO+EkqMi4nSYjAKXIgzCasF5BxQ9g2K8Mb51gfqGmtgooNf3
         q4VP4ZaoI8ht85PaUsQtBsr2OWeC4ugTJ+2/eStt1nWnoqlyRm5Fk6vtfxmJ9/uCO/zp
         cF4M0z1xoDXTZ3nuzbpTUNSd98BFCI2k6Kn70TQjsYKiQLVg21AmfUv03yUo1JdE9/lA
         Y5hw==
X-Forwarded-Encrypted: i=1; AFNElJ/aZ6sU8BArWQL9RR2EEvBBXkXVW9cvKUi6H8qQFUhmNuuCBQ8ZXrpDMMdckuToZj/XGFkNU6Ep3RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiq1ABWmh0ym+VmATINMENk6TXh78Wyyk4NzQ9+dy9LJrL1tpl
	RKrgkBtqBXWYJHG15Yx+OyQnrWYmqEcwKHx8khJdF8DQmM/GTO01crS3
X-Gm-Gg: Acq92OFK4jrnREKFvF+tpKhYCKFQ8FpTEiUHo7SiWyokptqFxvLv+Qzyk2pgRzj5Yl2
	PFjv7B0G1K8qO45CtVgzZbKuwuGo/HC/rb63Mo59pR1Kh0VvuSEMsmBKOeXAha8YSJM0r4WPjfF
	LxzkrRol9GGbZGvzID2mNAs5CALhkyp1RK1Y8Ce2Lt94N1o6uOOV1XuWm8hK+KcIyGcU+lEtOzH
	j/iFZ5WtXLOXNstpbdSzKZ3AedTkYkWzIJ5H7F0FbGkz6oAPS6hTtCK6lCtMWdR1NwqBBU9Yich
	gks4WMZqAKWDGz+eFpyOPWRy8QK6ic8HdFD9aIMeA1lS+NeY83yfpndFthr06+i9YE/53GILwIm
	Dy2FAhkVW8QUisgMp9I/y4ut4HNV/7bIQv5fE6t02LVS6CY3k973PwbFEsgNphqIQ5I7WeT/TZE
	s51fA3qti0CrF6+ENPY95RkE4a5eHo0nJWwkg6NeWekf6SeYCIMoyhItk2YnIESUkpLvGQUfQz
X-Received: by 2002:a05:600c:858c:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490360f28f7mr17896195e9.33.1779351750348;
        Thu, 21 May 2026 01:22:30 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm9490145e9.14.2026.05.21.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:22:29 -0700 (PDT)
Message-ID: <6a0ec0c5.16c38fd9.2b754a.4dc3@mx.google.com>
X-Google-Original-Message-ID: <ag7Aww1CbIvhnItD@Ansuel-XPS.>
Date: Thu, 21 May 2026 10:22:27 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-3-ansuelsmth@gmail.com>
 <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>

On Thu, May 21, 2026 at 09:44:16AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 05:09:07PM +0200, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > To correctly calibrate, the USB 2.0 port require correct value in
> > "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> > selecting one of the 4 monitor clock for calibration (internal clock not
> > exposed to the system) but each port have only one of the 4 actually
> > connected in HW hence the correct value needs to be specified in DT
> > based on board and the physical port. Normally it's monitor clock 1 for
> > USB1 and monitor clock 2 for USB2.
> > 
> > To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> > property is required with the phandle pointing to the correct Serdes port
> > provided by the SCU node.
> 
> 
> ^^^ here - required but:
>

I think I have to rephrase it. It's required if the USB3 is used/wanted. In
the other case for the USB2 phy is not needed.

I will bettet describe this in commit description and on the phys property
description.
 
> > +  phys:
> > +    items:
> > +      - description: phandle to Serdes PHY
> > +
> > +  '#phy-cells':
> > +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +      as defined in dt-bindings/phy/phy.h.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - airoha,usb2-monitor-clk-sel
> 
> 'phys' is not required? I think you need it to configure the serdes
> correctly, no?
> 
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel
