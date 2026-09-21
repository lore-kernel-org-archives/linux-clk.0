Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9E3E1713
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021182; cv=none; b=CqwFVd+6Z5rl7j9P5MJbtnPee1vaRXoRB+P9t8t3xYpiMqgF/zbMbFMPA6gLc4erWEBfB5M/bhbCfWDhwUe6vW/K4XeIG4sp+8QPFPD9GhX4EBpPKoxPhTB4unCcKwNSlh8F8H5gdu1f8nIDNcr/GFwjfGfUHc7pGeYlno/HuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021182; c=relaxed/simple;
	bh=HpKDDkYCd2Pwbo5rNqtxh4mKk7ebKSKtL7Zw/QAn2D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJmekpT1OyaszMmJ3Oc+QEHI4Dl5MgVOVLJpp+B6jKAQxh0XLLk6Bl8BqFiOInWJJ78FUbhVQMFkJ5SNiTg7fl3345sLdenVJ14aa6hZHkQSWHrT+4+FlDKKglg5+pA+cCd7SP/IR9fLB+L1D9+5JltsG+M4HMJr4JlbTHeabQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlg8g9Aw; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlg8g9Aw"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso2357284fac.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021180; x=1790625980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=qlg8g9AwPL9acSpqzohJoa7/BmsAIx7Ivq44IKs4uHxgfMlHVZleHZT9msBetSBMVk
         a6LxI+/CYssMLO2otXlj2bZEV2qDs+wgUURpoaSdmBYUlqsJhlPlAdZVeQMkVZwnguZz
         fmXhnAWEkfq1gGEeqGTnj0S0j4TesyPOHLblzV13K5DcB5zme18hE8i5OqVFwh6C7of3
         rgvyLHicH4xYLEe3RJq4A59FzBbxOrpegnB7uYf3aKknQgyNjGjYZZGgzbUikuwexUHt
         tRpCIn7/enr+rmFRRYRC9Hg+jMNlbDoRCkJzrphj6buB2kwAMeU4b1sQglXPyKOPClHV
         nRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021180; x=1790625980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=K+iMfPh/mvbY7B2YSxFkojui1bTJz0wwGzoUEsNR+MNd9ikrSh7oqsJUn4ulthDee3
         hxGBcHcdz14VXOJtQVIa7VcdrOybvTkwXz0raO7Nzq/R/vgDgt8O+ZoPQep84X5mCyEe
         vYSlHCuUEAHzdRVvI19SBaHjLdxR2rffJFsVFYj93QDmxTo5HIsLXMUGHXKpRJBpjgp7
         fy1KnwlyY3+g68ci/yB/DgNjsmpq+ANoL6PquM0tepFxTMJF+OT+lzbb3WLFTC00U3hJ
         48jtbVF24rXo7jJPuTkRplQ1FoVWg/ICRvdsxE+0nfQ8hTT0cm0GdRXfhODGODxKN87H
         c8kA==
X-Forwarded-Encrypted: i=1; AKwUvByp9t/tahJc/79QrL3Z0PMBctFiqOU+/wmxMY/2lRGkvr5L0+EVH9FDEwewBW/1JeD9earnGt2VdgE=@vger.kernel.org
X-Gm-Message-State: AFuF++l0IoKu2NKou4SV4sSd/7W8m4CaapFq0LZMxfuDkMFu1tElvGF/
	luTNrFfy33v8MhRWoW5tPR6AU3vY392NmC3A9nMmaW2jWN6Dxo6ichu7
X-Gm-Gg: AYBFou002G/2un9tH1QKDWUGZLQ92JfT6u/O+ZGeHQp6B6mwmBCHV9lzN2wDdnvzy/A
	Q533lbjRUZxIKL9Ldx3zRQWA/op5Pd/xi+eLfvUpiTkkBql91v6PBwg0kymyG8qQbnHgWZ8ggsI
	OJZHFAdET0lj3owcad0C2zRIWy7voX//M5k9Vy3bpKAHD62JFy7x4rAK4wXbOjhqHMYDdc6gKeU
	nL3mw3bBYCg7KTEaLfavRUDRq1hyJQ4XW3a0rUJLNIv6EttZgn5XMx1gtxZ1sZMQDAFDObnEQRZ
	ucwx6Rpa7s/3cymSrxafxaCO03zJRcvLQHXinFOK6/Xr2hCw67qzDVKgLack2OgxOOVJDC0Dlnv
	eycnJ/HF3NdpvBoK9DHob59NtCWT4qrKe3LYlDYG0yqOu9Mm3ajgKT9bv4V41PVT4D2PjSxKlJM
	XNtUoSZhtDiY/X7gCtSeY3PDT0/snHJFMQZJ61N1fapI3wgNB9j58Vj+Hnje2avLJ5e8qiXVq2l
	kxeqoPlcFcb1+k2ug/cuNkEHI++bm+uvWPsrzqecj/VUA==
X-Received: by 2002:a05:6870:5688:b0:488:5fb0:423c with SMTP id 586e51a60fabf-48f6c2071b8mr252272fac.29.1790021179689;
        Mon, 21 Sep 2026 13:06:19 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f6ce755e5sm170837fac.0.2026.09.21.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:06:18 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Mon, 21 Sep 2026 16:06:17 -0400
Message-ID: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan> <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This RFT series has been superseded by Junhui Liu's tested four-patch
series:

  https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech

That series implements the M-only and P-only clock conversions, was tested
on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
disregard this RFT series.

Thanks to Junhui for completing and testing the fix.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Regards,
Enzo
