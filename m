Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627271;
	b=bP5mq/bagwm/N/I1bQTcU9UM18IG0EFQMyYxNnYV5UYdrBasBjNvfWoBuuR9EiMUDcnI
	 JjccFeZOGA54OrejcwNP9ksXrZJ+1Rqk5UofFBcuqCquBXWbBynp3OcEhIdi3+HW2/sqo
	 FtA4JiLeeuT30XpJCpaFjikxZIBx/o3d+g5BKy7WICSS9i6kH6V0nv+IvbvKglMWwayYh
	 vyf/Yh+/KbDYrd0j9PcZVa2CCVwM6bS5X1K0RmQDLnGe0jpWEXQkjUYOyF1Mk4MYsFMZD
	 saq4t1Cn4/b+M+lRcvZ84jxLWeNYhv1iDJk6gMXBllAhDLANOKSZ2mA7n/5EGYLDBig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627271;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
	b=mmkHc3qiqW/AtKRuJ3p79rbixVCZmHJQKwSDaQZt4d2/PClJmUOvyCevpLyn266jI1d+
	 zZ58tcFfPNlXbftlwD3+SvifQrKvOFB4Nt6+lmBIu82iA4aBy0p/ZVfUGGBv3AatPNNxp
	 PRSAxUORRqUYgFyJoJsvhVM7WeHYwYKMCCkVSRm86V4rwwHQIWKDeQ7/OIQEL0VEuMSbW
	 tR9eglNbFFJwxje7i8rkgtxk+UsFvAlA3JqoPECN0+TftbcydAjN8uFR/UhppE/rC+Jct
	 7LIj8F0kLuJ2iA8OrBVLsXSNum0UgQb+UXUXdRdXeQh4gnqnxQeFe0a0IkYGZFR4ulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B49606A32E
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 03:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B49606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-537548b811aso10713391cf.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627269; x=1795232069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=GEUc6PJZX+EuqYM8ThR8DHNRswlsl1yTosyiYbpJSlsY/uN9z3rqaKyvnonRuKhaEp
         Kmm32MI12KLsPeAmjeyw/y9Z23Nr43cP7wCyxuhmGmdnP6nA9yIiY88tzGZCKY78UUXN
         RomzU2mVWbiZY7A2z0lOepbx/Z2ddOPyF1G4Qc1dvQDA8gfbWENCjPdsJpjo2OEODdgB
         Hm9GDh5is5lYX79a8Bz5+WVjYDZZFpctfzeI3grDe8l6QTu2Dnoj1QyqJJ79K2PXkeb+
         wh/iHRFFP8DRxRQ/ETf2jkgs/E8bZaOsDMusg1qmRr5OtI742rv6B7njXz3QTP1eBZEw
         TJQg==
X-Forwarded-Encrypted: i=1; AL+hErHwMw59VCq8+sgqTlk12H6CTsnMOC6Yx14MX0v/eFAUk28HrWa6qDP10Nrq0I9v8KYbt1OJF76otcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5ktP1QngAR0o/hKUBkrnS3ffPH3oeZNgnvlgiK2NacFxKEMY
	iy6fQ+2cBTKim/+69pAFQ7K6apYFRuNfWY/MdBRmDl5iImY+1dKSmNEJPtSkuTqSH+pSEyWgyTm
	REUFcRvp27MjfAs/GN7AZR+UFqZra4w6Lj7gAe7xIo4ZW2YvVXW6rExzyzfIEas2TkE/Gz75FoF
	UNYdxwZTa2yOEY44iWZ1MLvS+B3bWOTlUdGQVAzHiftXYsNroZOTUQn3p8oRRbZpW1Q8c+Uft4d
	S33eVB8ql/6aADzZv1y
X-Gm-Gg: AYBFou2qZFOjA9vtXVHi1M5JR+OxqkwBSMUjdNpbIp5VB6ggZ2YEO8IuMlDFwafhAoH
	diBGK0dB40CW1T891HFkWS8yAI6qmBU3kqxPCJ+1OrOWMhduZA/tu/qaxRwftExeKu8+a1l4DBp
	6dHRmgkev8c8REmRQQu+6dMFGPnIuz5BS091FROglDtYz6X5G1C+YBqwXzPEgPmUuOaen23x9Eu
	XrOUHezNyofEpc4U3D71IDTUqkg8mvmgEyzwyYNC18/cgRrpsg/l1n6M8givqHfcPMQxre/Y+NQ
	fr3vPmwb6zOcF1m3YJUzxUjssdPgdmwpTA6N/iSDGQWI2WaS8rNcgBIfxCtiBuorJF/RHKp4G+1
	wzucXinp1kBYapWZPI+9/9m54Irt+8EHZ8AiB63Xt7BbGL064upRZes5oiGjXLqtmQyuJU1MMl3
	O4Ep3Ynkl7EN0lTjd+xm5LTkFWs2LKlVRDy/lp8uSi3uY=
X-Received: by 2002:ac8:5c85:0:b0:533:438a:2aa9 with SMTP id d75a77b69052e-55ac977ff12mr70013361cf.61.1794627269500;
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55ad11f75e9sm1223601cf.16.2026.11.13.19.34.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso7071821eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627268; x=1795232068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=FsqjNyMfYgeS4j2kNrm/zfVVwKD8gp6v3yQOf5DVh7CEU0zFvg6tiYf8uA+setgmAo
         J7xTH3iu1L9zPuzHHGjVEHcV20AoHjk/tS0Kcpmel0PAmHFTmFlVzj2B2J6+1m5LVU9w
         EbEkdeU+675PubUrj3KbEAmaTvpfBvl6GU3S8=
X-Forwarded-Encrypted: i=1; AL+hErHyhSrLZuccC5Yc5GlK3u2jnxYy5JizHPusRpA3+N7hx9nr0ZhfHI2yybbpa1XsAx6vBalrG30aYe0=@vger.kernel.org
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253755eec.33.1794627268057;
        Fri, 13 Nov 2026 19:34:28 -0800 (PST)
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253710eec.33.1794627267158;
        Fri, 13 Nov 2026 19:34:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12865283eec.28.2026.11.13.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:34:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its clock
Date: Fri, 13 Nov 2026 19:34:25 -0800
Message-ID: <20261114033425.876398-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de> <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 20 Oct 2026 16:58:11 +0200, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
