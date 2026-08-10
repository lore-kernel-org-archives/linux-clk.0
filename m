Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3C44103A
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399172; cv=none; b=cnBdDMMG9m934HrIN7CPHLQx0gCHjtzikyovmVSGCIIFdfTq6QUTXC9DkNfqVkr6BAPmBrL4+sr+hUKjmtdhpARqb0mA/BxWQI6EuHpvnosw/UfEqQix57wZ9EqW/ZjFbFLHaoviMAJXGIkOiCGeBVVbv4XdZ5eS81EbwT7gnbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399172; c=relaxed/simple;
	bh=NoSNnLeKVX6y1LedGuemlWhGAhmlreluV4Z+fWM0exU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F63GcjRZlgBf/+AhvVbcNYmh6cUyQYQ/uqCQTlNKfccor9/RqRmgUZkZwEpPaIszRIbWNW3P/FOPf5JkPZ3WD8ZHJnhgyC4jA9BcUACOIJ273mZEj6qtEgVM51jXt+R1yXsG7r/l5zi7SYWMYZQCW3vgkH2HExfSshpPxmgTOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KkWAukZj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kGTYmVzU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KkWAukZj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kGTYmVzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
	b=KkWAukZjD/S/uJbx/ZPVXemfH/sLK+lCl+hT41qHDq3U0jKCwdcz91V4rTOtVqPuWlBJ47
	Y/Svxd+8r2AksIJeJSNOFPPNxO8sVQUN/rpHSXAgop1ZzylIocS7ItczWzjJWrCMkMskGY
	YOO1tQ25IPN7B0XXjbhh7/zTEWzpcJY=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-vnVRpNHON7i-GJsB8TkUjA-1; Mon, 10 Aug 2026 17:58:23 -0400
X-MC-Unique: vnVRpNHON7i-GJsB8TkUjA-1
X-Mimecast-MFC-AGG-ID: vnVRpNHON7i-GJsB8TkUjA_1786399103
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66898a9bc85so4197637d50.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399103; x=1787003903; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=kGTYmVzUzMc/uHXVKIzXSyJ9dbBEO2dUuRh81KpjrrX2jvif/rupUNLNxTeiQ5yrHS
         /K41NSus71QIogvu9ZbJsaF3t8oDWYVlVSsZRENjN7fbL+Rf7lm7qIQi0K6B3NRovu3O
         oiZl8RXW+1laBqG+T4kfS26yFvuTHEsXHsDJpWxOXv81Mg+pIrwI3DMwM6SmVLhl51B4
         hZ+lSMyTRlolUq9Aq9BJE5LiskVZGMML1Vj2UQaSNriebqCiiafZfZS3EEgwa7354RmO
         /KjVyuxP520lpCIefKtS6sjohuQBSA0hgFCjBdWccFyw+03XC0oC30VEbukHKS19xOmL
         F7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399103; x=1787003903;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=Hc1WLZ7OTVzSWeZYN6nFcLxVGCA/TmD78XpJjh//jivc3L0FXzTvr88nHVigCtrt7n
         f4KgMT5Pn7j/3O2cVpixnobG436qQ3EKjvCVXByBJyJDSvp15PGD7FSfevbAvPvuORj/
         OUdX0P+ljO0kFwQaPWtp9/GCEhLCXHg2NtMm7eEV1Re/9YIlbzCJI8TWPJD3WCSw+YoA
         0Q1WBoI4cgVXl4eWAQgqQmQs5lBJ5qNCLht6zKRkYWLXykH10WHoq2AQKpGoXzdBx3Ya
         A7wpW56Fi7Yx2y8DOtD3FDTH2XBlIhvt6V4atLKmSLBmXmKT45NObJ3DoK5S9iz94dX6
         fG/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWXmUrUeRYyw5W55dQ+N3e+b7y+PE0nn+oDoOyvDEZnlSnC1WVFTwJYsmx/WI3zhHEgRzgFColn6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YymhUeGWjF0NiFWfqG/ymvUIW76gXPsPQ6EKyzTRHoBAgeoE146
	Oo/3c4WhG/jW0EAMLsfu9+4p21vV1jLBJ0OnHjkL+0XHvAtJDDXJdxaDZMatke5SX1/aKiyUYPD
	qrYg/nKRqXmK0suc3cyRmztI2Gh01s/WCfjjN7LZ2+ZCQeNpa8nHLkT+fZpzxUg==
X-Gm-Gg: AR+sD13msORO/7yO4kybq/pY/XS0C/nKy/3onDNlz6Ixw4MaOp24aTDXdo/zDpbMvTz
	BKf9abN/+dcC2353iEY1bv8AkjFEG8iAPgy1utXSrZC+PQUjaUeiYG0i4yPQJQ7ef0UpkMzHvN+
	3uaC99ZcHa6A1kSXNcajL/7Y7mktBhYx328IfH3sv2KipW1ASSlk7Jec/3yzDsSdQYQqJkazFUy
	FOPgfhgEPl6zWDV10i/MLN6A4aY2/VAPjB37UH+cOjOLmHzGPQh1wZJ7iZzLMXCG6X5cawTEMQQ
	zsQC3GTYxbiyMOKWz4X7Pm/OISpHi20XNVgDEO6jCqNmXhYVOW9PikujyeBJ1Do6sD2EcjwDX2S
	irxe7Rm2rPmgk+zd+qFJoIWG1bCUt/J3i+hI=
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341627d50.40.1786399102940;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341602d50.40.1786399102538;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7562472d50.10.2026.08.10.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:58:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:58:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Message-ID: <anpJe3-voStp-5Pw@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-8-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-8-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:27AM +0300, Stefan Dösinger wrote:
> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
> 
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

