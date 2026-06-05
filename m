Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAEA4D991E
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661485; cv=none; b=DfnCVKreRJjIBop82vOYuWGzhVCB9L8Ik8KOH2qom8j6mnhIv8gK9AjlBq4GRCQr3XhF8y3LOi1e7BkH0IihBZM+An48ak+BEBfX9/AftMqPgodV+cpbT0OoirF1CYtHdUNumk5Ljx5l1IdM4Y4LzR3MH6cyJDMoJ8noQyOVsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661485; c=relaxed/simple;
	bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tao9vY0t+Qd0GT8YIUeeUZdQ264lWDABfhN2tnL7q9VtvJbjqlxZAuU7J5pBKjJ5eT/jzCL3BqSfHvDPJOfcdrHV8VSCtQjF3/Yw26poRjQR+BCIrrGVdPU8ARL91HEg5s9zrKUr50bxHSdI9xxAqUghgPcMBLEHaOYHaQcONKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7MaFxVL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7MaFxVL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36da151a152so1331373a91.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780661484; x=1781266284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=k7MaFxVLLkHHjZFRumQ6HJtJtN0CUkWylRKdZx/dInv/cuHogVjAsaINPot+y+il1p
         QEbygVdF0VVeKwZ0xNc/b7shhfX0tD44qTmZMcufmeJ/naFrZS8frCXY9LLyoMrm1ZSc
         qsPDK/YIwQKY50dOy6cyrzWP03v05Jv1ULNLYWwCF12eyiLgZW+YKuGJYGuosVPzWcjG
         3oYwr26PTMtTLQRxnnjRdkKMfMQFd/yd9Z4qmepaJLHRH9oZ/ICarcXH27wvH0h620GY
         +XJcDCVYRg9qa3ud1s/Z9UUWw1JGbipCI7RnFKFpMXwMgGIpO4Qt8vhzq9B29q+tJNGO
         gZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661484; x=1781266284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=Q2BxBsuU0H9szX/xmVF3C3kEfgd+jQVYbFFleoTZiQGuXdP/cuqremyUJG0+8z1K7Z
         wE37LjzcI6/l/X9Fx+i3/2AkywCGZFMXB3Q/AiMtdFtEEPgUc6q1xJ1xOs+VwL+gnDEf
         zQ7wQ31husvdtXC1Fb7n8O/+/nK/OssUNw2gz06555P62EK6pvK1uogi+i8Dt4I+LEiG
         cpsJexNiSM9X71PT4HIxW0cSGSSgLO59+mSsq/mXvs5AzJgh98jhoywxjdj9b+QVZI/G
         m7jpeJre4kIy/W5UK5/5u8px2TomEXSXNNMj0w3NbV0zktT2UEsPBWAWhoX+f8rx5Zt0
         yDIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IbKE9mfE08Czj6CuUej0d5rQYGJ6XF9DunDA0QNlybJhht8npi5xxE5+SDFLt85fCpiitTyYslVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgb8srlP+7IRfGDys7J0mx5W+wNYEQ+xPxm185OjFg6+r1wdgT
	yeheLStdKWOUNXrNc5gj+anXDZSJ+YG7V6yqY+qya/uC+AiGdlshykvM
X-Gm-Gg: Acq92OEsVC31SaItt/WVekmjz43SkjfqBzJtMwd1ROiqjt2UEQLvt94ox/aakaLkbiu
	h4LtmBt93ABnyHEIVg/PbgwJyS+XxIzCyMyZ68cM46p2UTQlKSIu+R2+a+MAtH/vMuJtu36m6pb
	38frC4NLPmDnZrk+Iql9pgtkUIEWh2Hg0e+Jmet9Lh1xtroCvFVGMGreCufzggswZOCVYVQ3ulG
	FSmpQpmyQKFBYxzUQISQLnY9PLU/leXuMst2EdWX5qDLu5iKN3y6k/y9JEF8wZ9C3n6h75ZQcHB
	aSNRKmllcM+8Vnp0TCfiaIqzK6nIXlcowwEyRDxYiu5N0C6x5vIcFpZYdTp4ayoOXt3tFu9GBts
	macntPGYbvk3kJq3MCkPcEzRUpg+lnMXF7O70xyBhIae9P3H8EjpXoWZMkCNfycrpAQOj8OLYoq
	mWuMhtiIjVMDOnxlXNuGr0Hl9ZDzacxgXEwaibXrQGPHF5KQMjH+RWoxbWoV+fmhTe9xjqbYR/g
	iBuTTol3zV4iLk+4D1j5AFoaz4T1/F7YeT4LyTbMyeeObjsjIoBAg==
X-Received: by 2002:a17:90a:d40b:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-370eee04b8cmr3336521a91.10.1780661483873;
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:4eb5:db6e:9a22:fd31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm6300497a91.2.2026.06.05.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
	dri-devel@lists.freedesktop.org
Cc: Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Date: Fri,  5 Jun 2026 17:41:05 +0530
Message-ID: <20260605121112.27866-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek, Liu Ying,=0D
=0D
I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI on=0D
LVDS ch1). It mostly works, but I ran into a few issues around DI routing,=
=0D
LVDS format handling, and DC enable sequencing which needed rework before=0D
HDMI would come up reliably on the board.=0D
=0D
I don't see a v2 of the series and things seem to have been quiet since=0D
November. Are you planning to post an updated version?=0D
=0D
I've accumulated a fair amount of rework while getting this running on the=
=0D
FRDM. If you're not planning a v2, I can clean things up and send one based=
=0D
on the current series.=0D
=0D
Thanks,=0D
Piyush=0D
