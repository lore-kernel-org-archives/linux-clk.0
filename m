Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632594;
	b=iS/X7yR3aVxszytSpdfYiM0k8A1lRzd1GFzwXJjjmJggzzUxeaEINYr6HsUaYe6qMeXB
	 /v1DU2TsWLj/KhyQw5sCy6kPizsRS7TQ27njJ6Ek/4M2FIx6hk2wypbd+m3vNgjJTK75Q
	 vdCBPDWbnsH0QS/Bt/qHa8AU4xtuACJPLYVzR0y0Qcr2X48N366ckmoophdSKDFAEpPUZ
	 BYC6qT0JX/kCfg7EebFSB29JCsRKl0NFJUbypTq7kpwjE+mIeGlQBGbYi9OjcZbNWGB+9
	 r84/yYIKwCp9CAbvV8g7Zl8qvhoV0TbnNS2sIUpKK3CBhNzXGMOEoBMPhnpLRqK5WLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
	b=JiSNGg5StBXd7+GqB0NpK3TSu5INrAR56WoVhPFsFemtr/nG9ApUkjY4reIj11Jiinxs
	 HtVTJJWQEZcxteuinPw1GTn8mATMOt8stuQ8+mVX9NaQJtSYPMgIIZOSEstr4COR3C0VR
	 XZlocEA9yXvk6Zqf0czD93BO6dS3B28CDCJGpgC14ThAvz4yD1jSwAIuw4s+88ONLtLrW
	 JyKPhq8iza691Edt+uzX5gUisqmkaJ+DgVaC7il6ZtrtyCRndEeMrT8b25V1gyME/k3Be
	 xAOhT7tuMqPGZiRREX3LdNWOm7G71ZAkjWoBd7kiOnytbHM31cn+5FrNCDaXmtYxrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=meVKerlp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73D606D807
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C73D606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=meVKerlp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so27382975e9.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632592; x=1794237392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=meVKerlpBR06p2xu78USFrY7qxx4y+v8+7552sDFZMA8i0KEUjtCFSxu+ZVvp+aLvC
         vAlICTSZMRXqjlEP6G/V6FV66qZGolxBie7o0HDWkfWOm5q2Ka1TTfMzHs4mcM1nmJNL
         ddCHMKDctIdSLEbRsHakjmCMFY4rp+KlnFKkte63FzJ0oWzu0+6mW3JhVaZNVVAQIKVA
         DttyTw+OfR+XSC9Lgi4hXW/qkzCIYDraC8PHOBlEdWmVAByC20/gX2FpAmrUo0G9as9S
         w5Z9RHlwJM2Whj1VS7mX3pQToSlsKXI/zx/l7wMhRZN4/GJ+LkRDbwwtr0YoM8wibyF2
         e5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632592; x=1794237392;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=k9aQ0zBsjqU8XUlW3qRR679Shf320pHiaPruY+MvR5XyBeToXUz8+Nm+PsUMqbC3Zh
         ZhlxlDU8q1yWhFMErbsOVCo0/JJ31MLovAuc2iTVD3RBZmeeZNtXMbe+K8iyPSIDvMn+
         oeFipxIxsV6uDHLnbeJ2/ykuMF7gr5BMUsuoXrKJuJIUeepJgudM0EaExR/Eq5yvz+n0
         48Dt61nBjM6Qhl1Ui925mH5h+jXLDqflPNvQhQf9ybPwLdwQi3/xH1gHS2qZFY1qospY
         ybzoebG7aDqZeaegQJvq8Q2d+WeRwqDlgULaQgQp/KA/28/mPq7+ve37wYfHWwoi9LMt
         T3hg==
X-Forwarded-Encrypted: i=1; AKwUvBzOs+fKIorMjTQq+2NVRg2oE+xswTHqBTAV6NaERPvA4zhT/IH7m2QJoEfiIXFeE7E89rKie2cJTMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd1veEcWhbwTN/HlEppN4DCPqoDVT23QHRKYyan9PJPzSbfbKj
	2Q8LRMX+EfJmPDfojiIYiwqAyIsdFViqy5gh/EvP1B2jDAsVrnuS/hb4P2rOTQ86ETQ=
X-Gm-Gg: AYBFou3BHNnYqhbhY8/HsqGHBF0vrhh0WhLwMNbHBi59SqqsFHQFrDBmFyRU4NRJVzU
	V1v7cl6DLzpH/mJCljGdA0+6DLF/fRTMKVEC6Gw4rbdZ1ll+smsygtRakHPBZJEU+UrL8KVC6ef
	8CPFTAgZKvYMn1o1PZNNDB9zEEKiiA+8AKbAv54yCFiw2x9MFLEkvyEeJ3ZgyhhX7oUTB/D96RW
	b3y67DNKz2spwUFC6ootl+00p8xKFTkrfvc1lMYBAl9P3h1MomisgiNk8bCyrvxB8OLh7Om+ySx
	I9CJiGUJlLK9QFVTMYJs9vOnDUAK2yqU4wdberjDGJ6W5XyKGwikM4lvSE4f6jkd4eL94KKNn/2
	nywU2jv6m8XNbOfKCgK6W1JC/0cnxKXpaEcmNH11v5IUn511CXFfw1CD0bU5XbKfMnWRQuKCzah
	4ilcq9tQYv0o6dysQXk/akUbddMMCLzNsAwYxMOFpzy/DlrHCrYER1zqrwjsG38jx7w1HUOK+AJ
	z195tTyc0NBjFifM2RQHf4gFdTO9P0BEOBDlxA6gegwAOB0YzTevWFSmheLIZLiN738aCuq1NlH
	QrvdaU7S/Zb32xMC7i45gvJ6Bh33pHlT4AvQUXsW7C+bw6Oa0GvulH2YzbGk6Mbe6X+ecA==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr78414005e9.29.1793632591746;
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm523955975e9.15.2026.11.02.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
Message-Id: <179363258546.2870673.13247205665671196595.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:16:25 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QkKO+7KRF9p6IxoBwO0rqMIDnmIJ+8dF2oqr4paee6Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvptqUrhvGV14pzz059soU2xjl9zPhutmLT11fbZy
 Rdu3fvJ2lHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJBKQw/JXjWX1Y2/5yktTy
 RsZfjaFa/tMeetoHxe05W5qwJelVlyXDP6VY+cVbpzBzXLlkmeSpanBhNmtS3yrpktO/+A6Vftf
 /ygkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: gxbb: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/17b53ee5a743
[2/3] clk: meson: g12a: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/8fb4c1084cb9
[3/3] clk: meson: s4: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/7c328cc402a8

Best regards,
--
Jerome

