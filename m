Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4F3C8C52
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948857; cv=none; b=KEBz+/1SHrmVIerI9EkHbHTdoApUtdJs9uJM61zu8HdnjV1HblkAQKoHg7tkZUZLQ8rlN1Hbv0CnaaoGyEAOi3Qd/X4IXr6MngTDU6iFeIK1aap0MOXLnk8SA9R+jes9VCdQ6p7+TqO45Koji/LMM2AsPYHBHOOX8VGFfv//vSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948857; c=relaxed/simple;
	bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjuirHI8UmkPAugR89OEZiSJk7cYuFBw85iK6pkngpmp5mWjCBPHL1/cX00/bzUHv9zLAT3PEG1NG0MlyiI8kXe/OlU8FHoBY+Qr2mHejZnlQv6bhIbJftc8/us4tA+7yyB2KtIOhKXFiJZr1/u4sjF+VBoCUNWbNZaUdMPGcYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqGIuUr6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqGIuUr6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4706f016316so70096f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785948854; x=1786553654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=;
        b=NqGIuUr6lio83NuAz7TtTSEKMoaq/E6CgVPh3/lfw3E+esf+tB7wyDmxalmqWfFstE
         X+T/NEvD2ZUOtvCJ8Gg9HF+8pcLhAi0eftbU1KHO/CWOQ6If7TPELsqQ4sotiVdkRMgi
         6f7x3THxuD/9NW5NS9jHxjP6UOxCjztz4oSpmHdrgAUKjy7QNuvZ6dJ7/C/jjFWYUjux
         2KNgBjMd6yECB1y6zSwV8yCGQx3OLWjBAFbifEYZKLY81BmcZCye30Neo6ji6Bd2Sw4i
         hIDR4ka7KGfdhqyTT2qLRx8rTCUkRRZj3PD/iw4/OmbwAJwIPeEb0vQUspGVIQA6Bd5N
         mVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948854; x=1786553654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0lx5fgW992e5Cz/cU4YqatMbomgvYAN8oH/xxnURBY=;
        b=n4omP6vd6Nbeo4WlOTIKbYSRTOjbITjbCo641rrnbWmBjZamDBie/JnjEm4qMYSnVm
         cle4EpWfN+1aEZnzsM2IPTlLX6C3cEabPQJ3Z+BUxruvxzPdHeNdN80ZXan/AgFvp7ML
         5ehWo9gUVqdaNk1lYxsfgZ9c1gbwBa+UPl2kt5NViSGbfmDnUNocn+IqNKO9ryknEEBo
         cTTLYzQRtuWt2GeJ/hej6bhhSpESomUxjaFGBfrGaB7dku1RhVwFWDcJg8WgchSrBzcg
         WmTdXl43K7sIn56tUNBQvoWvssr771F2b6h4Lu7afewW1KS7YUFKMPDyt8q4hgdRfPGN
         NxYg==
X-Forwarded-Encrypted: i=1; AHgh+RoNlk7lpW0+KnH9dDD8OQXaq6dkm/2y9DKvhR96AmaPtD8RTZFmj9F/nPRx5raj0En2lLlr9dS3YBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5YPzVgWbpJD98t6Uy6B5+/gkYXzq30GLj64gzPcI+v/ZrTls7
	i5bfqW80XNKAmV2lVuGzsLYvYimgffora/UgntVde9MmcERqLAb5ciEq
X-Gm-Gg: AR+sD123DscKgdd49gYvPd8Yt9XZ+J6qKZdJ4QqVMJDuMYlKmneJ1fuAY82QYlXuce7
	fxqtmaYaGL2jQ92DV+sIhYMUiQM1Y0Ro8Q+gfKwMqHn3msDuhX+n4EzgtxR3yzOWIBcNzbmFQFV
	A53kwmGZoWB8e3cA2FaMvXb2fxTCq0K+gLiSBTCe0AmAaYQAHIahfFEOffQzJ7if/8qviUpLIpQ
	R7b8tugIozrKTK9aoShp+Vx7aS4q1i+r0++Nz5qvUyhXdqLZ+wjCMJpPAggNDKJjJipBnOh7Mpq
	h+R5eyNjLeZ3ryIxmMybofyDUFZwBZ1EdIRbWf6j1LSMrfLqrZ4AEY4YzLa1LrRKSY6LO9NW3xQ
	4EAZr4Rd2hHaBucQh7DNTniCgHSKQPqeVYdkArrHRqBdlCWeuUP2LSTnczwI6Gcugx4rkw8D4pb
	FSX9bnu7GKRdnB4offD0PSoidpTlutmaWOd9O7eQBiS9824Zd9VZJFeyQZ61VxK3Zc+mu0mM/h9
	gT1wgAtXApWIfc3OkVU78FlrriObjN4yg7MzA1+gUbUYGiMzEbJAuGD4TRa6n9XdYZ6RiGzllzm
	+O4=
X-Received: by 2002:a05:6000:200f:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-47fec528a60mr6555260f8f.2.1785948853795;
        Wed, 05 Aug 2026 09:54:13 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0d7sm9829057f8f.2.2026.08.05.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:54:13 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Wed,  5 Aug 2026 18:53:47 +0200
Message-ID: <20260805165350.14710-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
References: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Independent reproduction and a Tested-by for this fix, on a third board
family: Orange Pi 5 Plus (rk3588, es8388 clocked from I2S0_8CH_MCLKOUT).

On v7.2-rc6 without this patch the analog codec is completely dead in
both directions - playback silent, capture records exact digital zeroes -
because clk_disable_unused() closes the new i2s0_8ch_mclkout_to_io GRF
gate at the end of boot: SYS_GRF SOC_CON6 reads 0x7c7 (bit 0 set) while
the clock tree shows i2s0_8ch_mclkout enabled for the codec and
i2s0_8ch_mclkout_to_io with an enable count of 0. Re-opening the gate by
hand over /dev/mem brings the codec back the same second, and with the
gate held open the board plays and records normally.

Tested-by: Igor Paunovic <royalnet026@gmail.com>

On scale: grepping v7.2-rc6, every rk3588 board DTS that clocks its
codec from an I2S MCLKOUT still references the plain id rather than the
_TO_IO one - I count 21 files (es8316/es8388/es8323/rt5616/nau8822
across the Orange Pi 5 family, ROCK 5A/5B/5B+/5T/5C/ITX, NanoPC-T6,
CM3588, ArmSoM, CoolPi, the EVBs, QuartzPro64, Gameforce Ace and
Firefly) - so all of these ship with broken analog audio if v7.2 goes
final without this fix. Is anything still blocking it from going in
with the next -rc?

Thanks,
Igor
