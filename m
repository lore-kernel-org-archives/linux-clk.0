Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C203382CB
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356181; cv=none; b=bGXajQX7Cb36d8ASxXukuIk30hbAsrG031jJYlBtgZRioOh2YEdrVLSl60Rhah+cpW0RqW1JEbMxsKLW9mpjKeE2AmqJ8cSgFyvavr3kaPNeoTZsGZXW2Om73xFJxua2ZbetAMb28oT/PV2PCL12IqdC+P8jLIN47u5b8KJxFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356181; c=relaxed/simple;
	bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpnWjkanpIUfgma7Ch4p2jNZFv7KjGI2+QvYdm7pyFtN4N5JYLmkCtSH2cm7pr7fmj2wVEu+Taeu9Ppa9C4nHgIFBqtgqFwTr3lpln1YVFZp1AeE9UU9NqMhXxHtny3VpI9alOY/C7/ZdBC/hMjcnJrOPgUYUNG+Zff89Cjzbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlBIuvti; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlBIuvti"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so2171592b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789356175; x=1789960975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=BlBIuvtiqfBycKEl7PqbWXm1qTZjVSxcjJj6TyzzLkzBmJw/UUH8ZVTUbQePibOAdI
         n8dAnKOCUe5dygqZnXkrSHv88eX91+SmS4DpP1OTEGxYV7YaRRH0FaDF7vBRMeA1ZJLP
         T4Q3j+0bgOhTYi1HateEcYuunVYctKypkXqZX7y3uB/FqZ7TCynZPNRcWSyEt+lYABjg
         RvTBgogpUiZdkoGbJUmJWZlfftSkZNGlD7o4w1wm72z6CQcAX4qL4+ZUVO+vySIKcylG
         JUwnjjErN9DBjg5tvND951j2FLO/EDqm08kIsd30E5wgHHgkiGAIoPO2yUgOAEHmzpO2
         P0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789356175; x=1789960975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MApwC22geSnVp0e4CwnqSMWQccKDcu2A0qes2ViRrYY=;
        b=CRtR5AeTmtd9825ik5uyZrV4QdTcPWVZGe7LdtYI/NiEtmoMDdhka25Je5/zgKc13n
         re254V0BkEivdfbZSv9fMpO5Ax+YDN0wFH1nF5q3FEppd3BeNWKp3eP2c/1RFf6lqIzq
         K83n+PkQJJWfZB3TxjtczIAY9BBzsOsVDxWXURtpMDmVQkDG87BnlQkqddW6M12BbZvZ
         mVjYTGtbgltxd38PKvcD3fJslwRQp+Y2zZ0uunXK1KzT9p1iAZeOO/ZCzXwZIloYQ4OB
         nRa0Ui25VDmPfzj/6x+NXE4wZaqUzuA2TrdmrPjnUodTbKYfoKEj9tsIHhgkbhIpIJKf
         9LoA==
X-Gm-Message-State: AFuF++mbYFOeHjXM68/sEn8I1pTA9CW5Ms9WbObDLdo+NgSbkojsGhi3
	uIh0ONHdd+D70HZr19NMgynNS1yG4G0k3PwHeRxOIbq7W8vjg9kAYJhE1qPLFA==
X-Gm-Gg: AYBFou2tQcdyOcDKOBDSdDju3WH6thgzgTaawHCARqEesAMH5AEnfcXC5jUkdq599Qr
	yCc3AjCHM3cdcT2I7b5KLhguL62CJM5p/cDg6yPDhJSXVb+z2kO2CDXPi399w+pbc928Gv6l2Dl
	r3C2T1J2l+NHjt2+4lHB7NCbsIL1FIrsdKFdzXmPcwqa6dqv7T114hsJ4iKl41kuBAVrIDS+7k5
	uzutA6a2A7ObtxjX1u+ZUL2EmQw7CLDBtu7zbyTJ7NjK3kHaCQQYCZSaUf8LQ+xqvOjG1MNZaXj
	WXkkMt7e/BMxeucjB8KuLrP33UnioOs/G76rS5YhN3js5ESRRRX+t8qgJG4xN+HQT4EbuhMW1+Y
	jG8iwHWZRU795/FjPkp7REQGSX3DDwb1V4geRzT5CdZUkJ/d2nyFp+WzS9yPeB5lt3/u7T1RpRv
	7HGWLTLZ1ahI8dP6fo9sCIF3VVd3wDctPj/an5xTVoKtRKNc5yxFQFBdaVwaggTFpGc55+5EFoX
	yiUMeyM7RO5L1TMkStHVd0FgPj1NHj/da0k/goK7JzKf9o0LccL38v9c5/oB14a4EVo8xqHJA==
X-Received: by 2002:a05:6a00:950b:b0:869:8620:26d2 with SMTP id d2e1a72fcca58-86f82f51c34mr1825446b3a.1.1789356174723;
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f3csm4014523b3a.16.2026.09.13.20.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:22:54 -0700 (PDT)
From: a0987203069@gmail.com
To: linux-clk@vger.kernel.org
Cc: rosenp@gmail.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Mon, 14 Sep 2026 11:22:48 +0800
Message-ID: <20260914032248.387264-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912002326.237419-1-rosenp@gmail.com>
References: <20260912002326.237419-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rosen,

On Fri, Sep 11, 2026 at 05:23:26PM -0700, Rosen Penev wrote:
> Use a flexible array member instead of kcalloc + pointer that is not
> actually const.
>
> Simplifies allocation slightly.

Thanks for the patch, and sorry for the slow reply.

We're already working on a different fix for this driver internally:
the ADC divider register actually implements a simple closed-form
relationship (rate = parent_rate / (2 * (N + 1))), so building and
scanning a clk_div_table with up to 2^width entries via the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers is unnecessary overhead in the first place -- we're replacing
the table entirely with direct arithmetic in recalc_rate()/
determine_rate()/set_rate() instead of just changing how it's
allocated.

Since our patch removes the table (and the unrelated mask_bit
mechanism, which has an out-of-range shift bug at its only call site)
rather than reshaping it, we won't be adopting this patch, but we do
appreciate you catching the allocation issue. We'll post our fix
shortly for review.

Thanks again,
Joey
