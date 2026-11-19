Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111741;
	b=Vv6TEbXAOSZR1Ym8i+3MLvMRtCr8u3ZBQ+Wga5Q7Gg4g3ywWb3b6A3ChnVFULH4jHRG9
	 CUwRMrh/W4gROZ5ocnUo71pa1iK+LiXRoPTTT/LV64XR0Ki3WYkl+We9wdt4odHuMHcek
	 VwYxfoN7nzav6E1S90GOe0dxOKzvhXXjfhdWZyqR1D/bAAjVx6zaGQGgHHZz0W2G/t05J
	 Hhk4ioub4oytH5VuUeLcXGyGUBAcl9DW2COcws1ilac/FdMOCbnnJ70lmfdHpEZS7QM/S
	 amyjfvkR8UG7RSdkAS2KSM099h7jB8cfUPuys4yQZ8MavR/INnBQa3IplC3sx7ThLJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
	b=C4cBFG4QwvsHb1pGjt5Jtm1P7odDLmzAJuCPm9Yk1TL67iI6sQ8Zq4SsLm9yQVk01g5F
	 /0PUTSvx4bMZ34iC+OeP9t5yEvYfeCI2scdJx/xkA9GeqtgCKSHHyOQ+V5bA46NmDL35I
	 WzB9EHyP/y72QwDE4Ef+VdSdS7eYATOGeANcsCPu/w3SylkZbHh8VNQ4hbK12Js74+U7w
	 Yu58bEy4JC86sUcz8QcjJiGxrYjygu4LEO+RnbWOs2WvmKvEBPgn4nVjeQQJVrOtSyqqj
	 4x/C+zPVJCiKxtxJkD6CMUWJW5dFH32ANK7HdNGHfcZTsRyiTQblgNoUDUDh7OB+EuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xQrt2+x;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1628606A326
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1628606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xQrt2+x
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-490d838b425so48817fac.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111740; x=1795716540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=0xQrt2+xsPpTS16h3fqx266qEAuKwmj3GnN9xfruwcUqV+MrIs9fxEifPXtj8vL9k5
         hCoeDv1cNCa63azX5ESc3UsAMQY27+Xz0i5xy4B7RRn7wXZxz4MOXzOwcNFjkYQdY71Z
         Ek7+egVgUh4AqVuPcR768nicgIDH1rOS7Fosc8i0j9PdM1WvutZtE16Lff8ChmWT0PCe
         QpLo5n4HpdcWl/7fE9cFHduuLnuocZEdl6vuHic3lhDwfEPvyzuCqEq5A7MNRMEwWrNr
         l0VmQhyvp0kpDzpiyBsaPjh+tT/yFm36e/LlYCt8KFBqRqODXcx7zJyL3notmpHti1fk
         lGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111740; x=1795716540;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LpUWSQfpzuimr5UJ1RUHtokD4yvNzLYRTwB5Co/Fic=;
        b=O1slF6vjOtgAzrttiY9v93nfiFMv8U7TzdDWeUTk+AzCvbWZJfSmsiwAJYo0pAuvE6
         V1pKSOjBnjW8N6Xph5aF1sq+LTs1cSYIBJ9AWH7Y4L07jsU002KX2FLT+ppWN9O8gvk4
         9v3SGb48e2f/CRPt3EBbOeRCta6qH0KdNt44cmDmIBtqNDeXjfZ/vxMr4sMRNKU/4Bd0
         wB1qDQBOS9MBcHZPZxS5mO3/ZlIxn9I5ULTpoY/ZAOx2y9d5frADAFss9n7AZGQM4Rtj
         risByZ0eV1xOy8kxMqFke3uL/RRVhTUecsDHbiMXAsj3xg2Uq94lehMeMbtcrUM+PmOr
         k1Cw==
X-Forwarded-Encrypted: i=1; AL+hErFV6SH+CoRB5hUG0+O8M3IV19gPc4Wkb+eZw+fohKAB2cVh1RbVsFg95+V1jz3RVA5bSFELbId/tdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fDX5zZRT9/hMe6lCVG5msx4CNVVit/cS2PyTX07L3q3i4RFXy
	tZZ2oInwazC+/bfYz4ReoV2hMvN7LhmK92XEGsNts+xsiY5rQAxn8H7N
X-Gm-Gg: AYBFou1pWhxO0pH/hxoTRI5favMpuec6s0J7HRn8oY4wL2pcve4GWrJXyajM/iQsKHY
	LuJSO7EBfD7wgVeaAX1AwH95XRO07CDC2bul/uJ5xpE9hg07K5BDNAFWAVU8GNnC41CphxICIZS
	1J/XG8iNRkhGrJvDn85fRMxd3LHqXRk+gO6TbwffgP1iUAzLNrN/HMqOZMo+4xPrPlYsVz7Ru5z
	cbLG8TH75y+Dw94OW1DRJDpjq4f5cwQ+1UmDmbEVoePFVFVsd3Md1/7c+QEVNTEzG/UfZMNZJ84
	FbYq6VAYXm8twX7TKfjsb96VLaUSto79eoCRYFM4rdfrRMGgIP/OtZMg7kBQ2qEFsNaH1AMo8xI
	+zCjOYbGKecI5+eMNZSlbgGkgJDoLYCJUNWZuMOnsrRJAJie0nlXG/pgQ3F7ELJvbyWkiq7+k2X
	v/ElDWUW0UNPD5Nl/K4wn/clRgMHfVGpc4qNKCZvS4WYMoD1FLlw+I3yLMhFRfluCUPQgJ0ltQR
	d6vdIDqO3Z3ECG0rb+MfdhqcPgzFX+9ZputcgNVX7aCcvxWLt4S/ncHrwS76C70PgSqG4UPazUs
	Mk6lwsN9ttZJ/ECpWkfPSgqS0Xj3VnS2R9hAS1DunuHs0LgTGRSzkXVXIHcDeuFauGy55a0d+6Z
	Y
X-Received: by 2002:a05:6870:dc48:b0:491:47e1:6283 with SMTP id 586e51a60fabf-4bc810b3516mr386675fac.27.1795111739744;
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61081159sm452437fac.15.2026.11.19.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:59 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 19 Nov 2026 13:08:57 -0500
Message-ID: <20261118-a733-fwclk-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com> <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com> <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com> <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com> <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

Hi Chen-Yu, Andre,

>>> But I think there is still the arisc on
>>> the A733, so this would more likely run the management processor (SCP) code?

The A733 CPUS domain has both an E902 and an OR100 (manual section 1.2,
figure 1-1). The vendor SCP firmware Radxa ships for Cubie A7S, called
"arisc" by Allwinner, runs on the E902: vendor BL31 writes its entry
point to E902_RST_START_ADDR_REG at 0x07032204 (manual section 5.2.3).
Radxa's BL31, in its system reset path, sends a reboot request to the
E902 through the CPUX-to-CPUS msgbox. Exactly where the no-flag reboot
stalls is not known.

> The question now is whether this SCP use case is something we deem 
> useful, for mainline. If it's just about to run the BSP firmware, I 
> think we shouldn't bother, we just don't support that. But if we end up 
> running something like crust on the E902, then it's a different story.

For me this is only about the vendor BSP firmware; I have no other SCP
firmware for the E902 to test with. Upstream Crust has no A733 target,
and the A733 TF-A port under review resets through the watchdog, not
the msgbox [1].

>>>> So, not a fan of this. If the loaded firmware somehow needs some resources
>>>> then perhaps the software that loaded it needs to somehow tell the kernel
>>>> they are needed, like the bootloader patching the DT passed to the kernel.

Vendor U-Boot already applies DT fixups, but the A733 CCU binding and
driver do not accept protected-clocks today. A loader-declared handoff
would need a new binding and driver support, plus loader changes.

> So I wonder if we should just pragmatically add CLK_IGNORE_UNUSED, to 
> not shut on the door on this SCP use case later.
> If we ever only want to use remoteproc, I think we don't need this patch.

CLK_IGNORE_UNUSED would also leave a future remoteproc driver free to
gate the core. Chen-Yu, if you are fine with it, I will test it on A7S
and send v3 based on linux-sunxi for-next, with Andre's comment wording
and a short test note. Otherwise I will drop the patch.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55200

Thanks,
Enzo
