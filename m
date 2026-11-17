Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909486;
	b=Qf4ldDFO/U7bWHOZv8SuRLNHqodr7xTGn8EyTxVrMWE2a88rcpK2KFzS/seXP6EjXQQw
	 /j3Vdi23l2QnBEf+WQetBN+OnPHxTxkDnGkhnODanmoW+L48/ZeKZlelzEby2pefbagBp
	 tk34l94CL7trc4ilz7E+TYQwpoHtTXJZY/ZNlDriCVmeu165KVWj+ivwKv1f/KExpB63u
	 AK67x7stV6O0dvInbc/IzqAnSGqDdJyhkbJldmeZpAKy5RobG4M+mqTRApJAcGpw93CJW
	 A3VGUzf8QWKYN/Wsx+EI/nKT8p7ADK4MAtNe8VkwIlHMJSXQSacpdECC7bcBETwGzxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
	b=p6OMaZ5xay53duUzKUzAOeSH0McUF8QeuKotFvhwehtkIZV+eyQwiRqlbYPzxr7J63Gr
	 SWNchPzxhUQYHiZt6ISd4RT9dz6QMkJkfNt6drCFBY9EobAB4gEJnh9/gYO81fqwruxaD
	 1jRK41eXoia/DRHkwSx1Y9eebjnqsFcid9alT861zQmBcc04AyN2PTFOsEcOGe7cNGLFP
	 pb4mjMfQib0Rfl4Xwg92zK26Isp2kVcGS3Tp1MKBi2H2uRFkMTvOz/ojWEd3djbTtiVPh
	 Owvog0lBV9j0TptOYIsXVL0YziwLiRzsY7jATQHljL3BzOgjwkoyi9MeRwEc0iroc9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBlbz7UY;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07E606A32A
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 09:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A07E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBlbz7UY
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3945188f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794909484; x=1795514284; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=HBlbz7UYAPrmBKFGv1u4Nsfq7bxdUa+wlgZaXCZDRVHRIndL/ZAcDq3gnvWc3RrrcK
         9PTTUT06rDDFePGSAXZ9xFE3ULqvtH9HbEHteJGLPTZy6v8P8+jAGTGoaR7SCGwWk8le
         qJVtvGBERdEIflHCMnAdfdz03ysMIgM+7rLNaKfWrakYShK0NN8+krffTMco8/5yOS8o
         0uPHHPkfR/ADmOXUXOBFNTcBSqCfXZx1bh/gpqaq6tQC9h4WDTmw87n343r+15D126v7
         C6AWn5HgbBdaV4yiwNiStLkTvXw4InemsPD1qTwxtSeJ2jOv4qh1b9MomF8C37TUZ0wn
         ugZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909484; x=1795514284;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=Z/7mAeUVdvVBHMcXVoTCVEWZXWhkDbFJcHb9Rx3l/hAStytkmtSaBTUQxncKkBhhRL
         K18faZRgOvD9yKhRjgzMFYErvrccWjTskWk+PqCOGZrWWJG3v+KG+D7o7pHwxZbRDoKW
         xNWU7Y+jtcrKzn8bt1HQoq9am/5HGSjjPAJ1QyDsjdHyOYp0MSCzWSmBbhJ4qqhHK9SQ
         GuEM3fVS80A39OEfH5IFDhpbJM4YqmmdnPIfxpqqaf7vgyuH9nlrGeWz5H0eC/OZ9iXc
         1FM1bWMr+il0HsLh7VDWxJh2UsjAZHvCbusoV9O5sEpU9xyH71sDOl5fa2EbS8Z85XKy
         cVSw==
X-Forwarded-Encrypted: i=1; AL+hErGb+R6mW1Ylekem2R+PHRQX0DQXQJqNtAbIl4EvdAQg1aXVbE1OLZekvvr+IumGtqVOymhCvDNwAjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OmP9yIvVbj1KAWo45Pu97nlrwZNktBdzMQWheX9lax+8fc25s
	R2Rgx7H1l5Gnn3UV/rlABjNUh7lLWXeYqnYOA6wsi9BxPKWiqgZ2yG/FPirGOKv1kPk=
X-Gm-Gg: AZFdTZcT9U8leFVBSiZMWseCd+0VgdtVEqb0e0siQc56oaq4AgZndyNJ4D7Lg3odjAP
	KAUFY6AXwuwTXl8J7JOT53JnjmZJYYyLcTGjIepARFqTEN4n4An1lQfjnDcRi2oOLkx3a0naIfc
	rMfsNzf07ZzzH+EXXE17ZEHty4qvt2C3BrD4dzhqCh90groR1d9BbVZ3t3WZ7ttxjEAmBUD0Da9
	35Rd3vXeqJmb/xqaIgZJGYpjcGdwplGeajXPhi9anr4bhVs+nx4NpJJ3d+iloCC3xAE4SjG4Xaw
	iVxi9JNG0WZLy0hrbsqwn3+ITJ0tTBBKjfAVDdrVgh52JKrfd29lBjmQHRaZUCtKou6Tri6w0Ws
	uYOHNsehzJF4Xxh5UIG9WqnOvlboMvztiV0tG9IoKlom/V5mQm0TjQot5ljxpDKN9eL1QUolEjf
	K6W7GD4KfGx/mSJl0E+T7eVFExACo+jNUvam3AKGqPqCRgND6cwvKvnh+9f5UzTQsleUqN5rnVx
	kZhrOyUydz/6eBMiSLo5W34POlwIzxNQvunTcivqU5X3e4W5ByMArh7OnWoBhoTZIpKXWzoOjzv
	Wfv+zVD0s4OZEItka2ZApMVxwelb2rsZZP0UzV0tDFTfyiY/M9SuI/SuQXgHcQq5YVKKtg==
X-Received: by 2002:a05:6000:4911:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-49c71784fe5mr27875992f8f.32.1794909484352;
        Tue, 17 Nov 2026 01:58:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a33c344a58sm4540848f8f.34.2026.11.17.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:58:03 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 0/5] Add StarFive JHB100 syscon modules
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Date: Tue, 17 Nov 2026 10:58:02 +0100
Message-Id: <179490948276.13037.508529632883431639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=A60UEjvsGJwLzqqdQ3rQrk6QSaP2ECtLpK66B0J29GY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/VLU8E5Zp1f2ZNK+vg/vIfFbPR3sinreb/npj0eJx1
 139qviZjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkkxHDXxHZRufsaT+tZf2+
 Be3sz/ZoYHgdJipjuqHoTlP3Z13dLEaGHfJfWzfulbz7PPLrpfZFN7IWfGW5Ye9es+dGaHbPb78
 TnAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-10 03:58 -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common syscon)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h_syscon		(BMC to Host syscon)
> - h2b_syscon		(Host to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> - sfc0_filter_syscon	(SFC0 filter syscon)
> - sfc1_filter_syscon
> - sfc2_filter_syscon
> 
> Some syscon modules contain PLL, reset.
> This series adds related drivers for PLL and reset.
> 
> This series depends on the series:
> [1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

There is still work going this dependency, on things you depend on.
Please re-post when things settle, taking into account feedback on this dependency.

If you can use b4 pre-requisite to mark your dependencies, it makes our life simpler as
it help automation pick it up. Thanks

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

-- 
Jerome

