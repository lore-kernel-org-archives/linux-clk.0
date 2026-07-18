Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6572B3CB57C
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385978; cv=none; b=n6PhylCreVoHCwTZVkMQ30IlOZXc6F0DBR2kzMOcpRQhj6RdAV5JOItUuWV1ioVMy95nxlYvop6yzj6pASsYKDLOMBj7JWuwTpDQT5vLPEMhRwpZI/VKissyqDSmD4XtigbyLFXe70qvTZKe70pt7oyunSUmkdE5mBhZZdidVdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385978; c=relaxed/simple;
	bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn5jdV1mRV+OazhhWhefdh/Gy3oXxAWcUjV48E+VSal7dtj641yenM+LYQ5bJCD09DPtOOewANSdTOSe/lC+W2lvS8Vim5AS6zZLPqpKFT3GjVqM+viP4owR74DAb3zqiy5Th0w3sCwm6QOvtoT69f7+lp1JbSj0jGmDKr2VtTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFqISbMx; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFqISbMx"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5c9211d2so744112085a.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385975; x=1784990775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=aFqISbMxMeI3PBTbzZ/BF/w0TUAlJCIGydRF2mEipa0728ypSkZIUtFrBK26dyvcHw
         q4fa2swkTV9CBHsomPBL4/l5dHXU0XwKV0BMq1XlKinMCp+a2BRVWcT2cw0IQ3udqFDI
         nSU/R18gbHvDC49Xw2G8A7xPhuSwfsA+OdMmDQfzK+Uj66WZFy2vGFZI/bxpECWPxCbe
         8ESHBY7c83ZmfUw+Q/rh8odVQV/pTKL4uj/ZBVr7jYvMElFotc1x2dFWtyNYWA6GMkZW
         BT3++UWtp29+i6MA3jIhoEwH/2KwzjwJyyLhFRRA6sB8r3CI5VjJ0X1kesecxnqnjHA6
         RHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385975; x=1784990775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=dAzQ/yMAYcFKNwMCZrwm2sNetoSZ8HOnZDrkYchvFSUd/2tPVfzu8/QXsrR1Xi9/IG
         pgYcbVugZ6AcUZbkNYDXxI/0JiGKfXDgCpxRRxdEU4TD6uG4nMSAouz4eBal3kf7KKPC
         6yNEpBswnol1EUkGSsbkzOjPkDEKZ7F6AfUhi0OUJ73MzK6PqL0xWaivZVHu+7cg5UqF
         ndR8EA2659ogKRkajY7h6LytALHuTsbr2NVLX8wLm4uzSUP5hmM9DZkcUbMxwRNXESiP
         XBPB/+9uBmOflg8kpRKrJg5uoNd6reA144eAKHTibAfAJ2pgPf11Eol0nPACK+IISYAs
         VSkA==
X-Forwarded-Encrypted: i=1; AHgh+RrjNxaPlK9Kx0EEAdr9wRdphPlQjInm1hlgiXQuBBpvA3w++xocyQXQzaVB2bm5W2G87hAFC/KCvok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiHa2D/sBFPvg/nEpF/ZEdnPMtDEAxl60BJPYksDvqLfIfMLi
	HpCj1f8ecoWU06QjfIYLJXr5XnS8522mc+V6QQdxLpUCHy3u4UQGwuS/
X-Gm-Gg: AfdE7cndPAVYZr5fzfkWX2FKf9FI4kL599+TSVcxYXk2oFStp5H298aGlMbw3a7u9P2
	yYXqV9josEZX3XOi6JId3dJHl0Hi3Ql9MW6ezaLh61DCEoCj/A6Vw8Y5dj38zt00a+1Z0/4TrPg
	WC0MSJhGUpRjdb8IEPuS2Hkz9OZ4r/r7ep7CJOW5l3EaxbvLdgEJTvJLmf1IgFiWQnTZmCNe3zE
	iCszwQQCoy8luhm84FtLXLZDidMYK4/68v17rwti14BYo4eOGAA0XOlzCn6WH8bn+k1SXNS8mjK
	uhX2gVaKG2FkJJk/RGCPmWX05qL+oYvzKQCozs0BfOfj/+05aynyUtcxuij0Az1Djkpsm63jElF
	6Z3hA+gBJGv1m7Fiiq95hS6FHS4V4/Ge5emeemoA74S2DH9j82D38wDsJwFXKyVzkmI/3GP6GQH
	9sjw5fy6vhVp29o5H3jRaQ9CsNp3gn6wXELPpzmh5Ig+5hmfDgUME3+A==
X-Received: by 2002:a05:620a:400a:b0:92e:e252:bb43 with SMTP id af79cd13be357-930b4381a6dmr700628485a.77.1784385975182;
        Sat, 18 Jul 2026 07:46:15 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ec44sm418682185a.34.2026.07.18.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:46:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Sat, 18 Jul 2026 10:46:11 -0400
Message-ID: <20260718144611.1523567-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I re-reviewed patch 3 in v2 after Andre pointed out that my RFC reply lacked
a formal tag.

I compared the RFC and v2 PRCM drivers and rechecked v2 against the Allwinner
A733 User Manual V0.92, chapter 4.2.5. I checked all 11 programmable clock
definitions (register offsets and divider/mux/gate fields), all 18 bus-gate
definitions, and all 13 reset-map entries. They match the manual.

The RFC-to-v2 changes do not invalidate that check: the four R timer clocks
move from the MP helper with no M field to the P-only helper while keeping
their offsets and P/mux/gate fields unchanged, and the R PWM identifiers are
renamed while keeping their offset/mux/gate fields unchanged. I also checked
the gate-only BGRs for R-TWD, R-PPU, R-TZMA, and R-CPU-BIST; the manual defines
gate bit 0 but no reset bit for those registers, matching v2.

Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>

This analysis was done with AI assistance and each finding was checked against
the cited sources.

Thanks,
Enzo
