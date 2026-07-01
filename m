Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1448C3EE
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922148; cv=none; b=TSzM6aJt+J9TmvovPfN5L512BoBMF77BWO3g+EwlKkqivOY+EUn28qALCnNlQbhSa1oEmPIwvwSs18Bsj1eKF06dueh542ZS4x1Zb9ysP6ls0bnJB0FbW5954vmFhDzhmvX/hwjvCB1T/MGCCRFreN8oeR/s/tILCyXhAme+SRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922148; c=relaxed/simple;
	bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sl3OlDzLRdMePqB6chfZqYfEwz3R533+lcjpQwZozK9+j8DYOTJJfGczjr7G0eZztNTcr9P1hhoFa8LCw8ezqbgWeBOC3xuIRleIpFTvm4k+lN85TaQSOK1lasFInK92JnI5ODU57upbk1bG51GN+LEr4UatAPuqGNSbOh399QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhFFDJxG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhFFDJxG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81086f7abaaso11344887b3.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922141; x=1783526941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=NhFFDJxGrbfu8ORIh5ZCTDSO7HWovTDCcIe4MF1BM/paJptFSkkY57zxRyE4pZsPsU
         oPlENLc8miTKXOdue0J36h8cOBwS+1+ld81Ww7cSyTaI1Kivb8NrJcFRaThQw8OCt8Hd
         27cZKUi76JSyuVo6lSR1mglBrq8Nddx/YjO56Ww00GIZW7hr+OjFTdlNNXgT3UnYEtA1
         ruKLSBvnbo4P/EHWstHbn4gMIv0IUsxgMdPyLcYmz7msxlA/2U0pEXsd5Z05zMMAvUuv
         pFOwwXZ2e/hakMMvccnjwekZLclNol0oudPs1QvQCJQGTI+vZsmdKqypyHdalqK1ykNQ
         OgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922141; x=1783526941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=XtsmOkjyMhDLoF7LX3rxUWAJ6Tf/3TQxM6dGFB24d4g4oBoEPeoOmwABvnf6grrr+9
         nf4fY7jV8wD8ND/75BoB/SamreO+Z6r8XfNxXGa8q4aa36BbZ+3EQuedktmgRiVC5+NQ
         l/uaVnGl5Hfdm8d0zn6S2TAiiT0T1j9knpsw1DZ67U8wXvUseqaaF7bbsN+vu++esOt5
         gGwxkOeUedH3KykiwH3ZGBJbQZSgvyUL/SlQIlm9y7uilTT6zOSw/mDh0Ioj3yNJipbM
         lCjHcCMXwVQgPRhOy2r7XD0t2bBLDnadGVq7c/TGirHifmgxhUMELZ26e1zyqVOuf/dU
         35pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp89+vTL4GKdFRaAbRIjB/9kuUtjBTHPs64popUPD862vjPP3nZufuttzYpyN5o5z9efIvKuqySRmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKobG8Ii0iY+pmaU8bjuAxKOU7MHZerejNUIJ7gRxcfb0GQm+3
	lDE6Q7BpmU8sRdOkB5+wVI3XL5+/HFiMM7LrRY4eIsqSXjHJw5b5sPOs
X-Gm-Gg: AfdE7cniQvc2fy3jKY6hhp6BmtDX8R0Y9SzBiRQ1qkd4C2y+JhFt+mDglYU66ZsBofX
	RAYxDibyl38HZswwF3k1NpSezHr+LP3SVpS4vqPvtjQSN4I8MPnTH+nAWjKzYk+E+ixMzVdH19j
	SmIW546nHQI7zb9SjhhtgFgHJygDo+7nS0bmQ5vzA1rKbi2LL5ST1c+MoJPQlhGTybEfnjGjipp
	bRdKiwV5SUvWsuBDtQKra1lNQkkn2rfeaJrD5cvNQFoQsXtwVLbwxjmL7nVl78iRhLBa8S3CFKn
	dBoaR25zsWH5q196UhWJx/YhiyscS8LbDQiaR/35e/MhWP+n7gRroJPdzBmtShnPe03+PcG+FoD
	sDtkPDWpFVVj2sLim8AldfJtxk5hHJJsaTNzIjuUMZhUUncgH5B5FNgbT9uamOfh04MnXbJ1Rnj
	UonAmbhDmk3Tar93un2PaLkrtk1ZQYLluu95SIYUh5lJtKWiz6dWkzKE1RDHHR
X-Received: by 2002:a05:690c:c506:b0:809:fd83:a88b with SMTP id 00721157ae682-812e8dfc9dcmr24185557b3.3.1782922140430;
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af50fa5sm1682067b3.27.2026.07.01.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Wed,  1 Jul 2026 12:07:44 -0400
Message-ID: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
series and the review feedback, including the NSI clock/reset handling,
the binding naming and ordering comments, the SDM macro cleanup, and the
question around modeled but otherwise-unused clocks such as the GIC clock.

I do not see a v2 on the list yet, so I wanted to check in: are you still
planning to take this series forward? No rush at all, and I am happy to
leave it entirely with you if so.

If you have moved on to other things, I would be glad to help carry the
series forward and address the review comments, keeping your authorship
and prior work intact. I have A733 hardware here and can help test the
changes.

Either way, please let me know what works best for you.

Thanks,
Enzo
