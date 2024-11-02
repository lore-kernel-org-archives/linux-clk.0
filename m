Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47D171E76
	for <linux-clk@vger.kernel.org>; Sat,  2 Nov 2024 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730567363; cv=none; b=CMq6/DBgRySXraygRsWdbYgNbKqHeyhSIv9X0xPRfTALVpBPNjyA1lekBeX++sECGcUOUxbcB4Z38mW6O48LTn399sOKQ/xWIgT2T3DZgs1z5o3B2EZnaYMa/QmehLZoUnICyitluI2xY3VKoJGS9CyhOfcETfB20jzOe7zyESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730567363; c=relaxed/simple;
	bh=Z4ujPaeRMEt6r7M7H1TsEVcv9xtm5hvQruVS6LMJgNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WC7CeEziYW8iEB4TKrKuh7iFaQaJLefO3pwqO7hw2zxwRjtUVVSFk7OgrVmJiFqT2RGCSAq6ZemRGkqCAWXMemB1pzQZGQHmCLbELJp71iNHMrF4jYCcXzwGkIKf7Ye0aatzIedccqqpMHfvMmnBNaDaXw1NwOf9mXK1VPadn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZetXxDm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZetXxDm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20bb39d97d1so27296355ad.2
        for <linux-clk@vger.kernel.org>; Sat, 02 Nov 2024 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730567361; x=1731172161; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=;
        b=HZetXxDmN8QlshSNxk61fUsiuCnePcI18I10cz+pzFpr+14WVEiM39mazf6BBNEn2h
         Ohk2XXW3EVZWFVBVUoQz3Pfo7SLXp2+pomwWdwL1qj4NJjJC2siL2ZI0CqUfWbLmvN+H
         t2Xy0pfNFas3HqknRQgMVVva1eRgp3ZF6cXplHW8favIvAYICny5tyiHpqvjlmLvXMId
         i/mJFBoZgG5iX0+Ty304/YEGG/bI6o+zR78E2QiDTPiPddGMAjNZrwXdr2V0OkuorvLR
         0G25Z69OIMq6gmkQMSGyuIXjAPrlCnEAoa1u9R4L+R/zs95PB5i92aLURxawFfHyedAd
         QObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730567361; x=1731172161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niemCpBaWtNTD33HK4hY7EmVvjCf6wQeZoDXMitV7Gw=;
        b=Eh1XOgyFBTtAlHPcdTWCZDwu2ruzbgVojP3OHwdJ7IDY9eAEiWxlLyKLSDWUYzBq9R
         HTXZiwkdOMkCKN2FQndqQxK3J5zU9OEdU6KNxjvFzPkJQIrMyKsLjYhLW9MbomQJm1nM
         lE+SQYBCm3e6+MHXnm+0ywUXJku1Bl47q0pZKFPJwN+GATbHBIpzT+W7QUAv6Ji2Q4Pl
         oYHKUTPqy0bezjhHI4dwB98QNikbcHKIg9vKhJYiHsJaIiJbixalaV6SXDYRXO2fUhqc
         wkdxDqdGMzYcr4bjezAmsMcaHpwQ/jUJtTIu/O9XVTc/Dmdo4C1Gj3Cz3EbQMBp1m7q1
         uS0g==
X-Forwarded-Encrypted: i=1; AJvYcCULXrvKrQSPjoF1Grmm8JmkLCBNkUiXUnvQJ/BxN1i4UzNSfLTvtKLNbpRTy7FYRc2sQRzAEMFjccY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsGKbTw2rDqubkNz5nlIWMornS6pqK6XsWDw/qiKQ6jvuF4Ls
	6g8DjL/wVpLExCZ1dhnyzcMFTu8soHl+eQEm2Ia0xcJ8kEQMWzyHBnbkswrppA==
X-Google-Smtp-Source: AGHT+IE57YiawuzlnoPc/P8d7TUPT1NkGH0WXOgqoMFowdmCtN7jxWsbHJCr+a/Z5Z8OOuUwKEUShw==
X-Received: by 2002:a17:902:e810:b0:210:e8b7:58c5 with SMTP id d9443c01a7336-210f76ff16fmr219810025ad.56.1730567361173;
        Sat, 02 Nov 2024 10:09:21 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8efsm35882265ad.55.2024.11.02.10.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:09:20 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:39:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <20241102170908.fa5n6pz5ldxb66zk@thinkpad>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>

On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> bridge, the window should instead be in PCI address space. Call
> pci_bus_address() on the resource in order to obtain the PCI bus
> address.
> 

of_pci_prop_ranges() could be called for PCI devices also (not just PCI
bridges), right?

- Mani

> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/pci/of_property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> index 5a0b98e69795..886c236e5de6 100644
> --- a/drivers/pci/of_property.c
> +++ b/drivers/pci/of_property.c
> @@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
>  		if (of_pci_get_addr_flags(&res[j], &flags))
>  			continue;
>  
> -		val64 = res[j].start;
> +		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
>  		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
>  				   false);
>  		if (pci_is_bridge(pdev)) {
> -- 
> 2.35.3
> 

-- 
மணிவண்ணன் சதாசிவம்
