Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202866;
	b=LuDOV8moJ9e5j9MEvg5odL7T8vFe5s2SszC2OIyPobYkMFM3x0PMC6Y727cRIQnTpTj9
	 R0pxcI/cg8RdFJNRznmdQIyLyu8NGBATmKo6AtTi7sRh2W8wsVYK8RLwy5gyZvLl4wMtd
	 /vpQd0vtlKG5sghnV2VdP4C5B2Cg1X9rXA7VS9c/1Qn5LugI2pWdJ1XLMZta/9gTt/jTZ
	 z+vbhtwYAk9x9cll1D260tTZN9v9fniRl7GQn9Hk6jiNanymYCFoLU7EPHcmb72LlEwKX
	 uOPcAjKhi1jRQza4GQr3ds1LPqjsZWE5JZkbqxryfXTNvfgrT/5vDfcszBY7ZcLZrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
	b=Xkix8sRhISDHlRS8M8NZqP5RukqAjXkJMutKiOHzRpeKcuxxRMCddklxIq0AtZKiif4B
	 PmAsc6xIFLRUeALXCPPgncsdqJuGVv5uZ3PBSXYAq94+Ijzk+nTIWKjOiwW4kcIVpMQQ1
	 lKj0UMidNK+NTVNdD+M6u8rRAPJbd3QgXdIK6oBjtNApQXCJgqpoTpy3GFmJLhoCnjR3d
	 9QXQb8q+RBU6qgiT+Q041cvFNxPkinOi/IwMiEZ2tnYzz/kBa8SKIEsyLRloDT9734ACu
	 CEdOhrWw38bl28KqO3PZHjeMjYtOp/1PCbeqZuoaaD3b3fhIEba6DkAJznzzgckeebQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q4ZcMaxW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E6606A32F
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874E6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q4ZcMaxW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7664245e9.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202854; x=1793807654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=q4ZcMaxWzdLtkA3zzlJS/tOaVgjyxV3N+LUDCU+2Yf0uTfBtM08gd5FHOmFJ6KPCbp
         EuxYd9avWQqzpQjWqNf31QPqzF3f8BKWkCZMlIDAPhvQwmU/1mggUdG/2uCvudRhghE1
         XR/2kNDcCVmFpPSK1sXqCgQ+kY6trEB3/6EoGB+rNCklMfhHjz+BALtjiBy8ZIV1tFhI
         O8u/yQ0auX/cNS97ZqHy1/hcnNUjydDycPgqNGbv+cgBzm026VxFNfN2UjfN2/iYIF3t
         ymLnDUgVF4OayaK/bxTwTSIVDMBdy5Nt3q/sFxeJtw2Izdgv8gXKi0/mIZNvS9ATphZC
         HJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202854; x=1793807654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=Wy6Zifmj92IyYASXWtnz+HfZ3+cFIttqHLqnH+xWA72uPrgAYCajx8SCbjem/o8Mzv
         V9zV3725DpBLbEuwGEcAUm+bXw8zs8xHxgCjcy/om81WRjRTJBr31hrudP6xhAXLFztQ
         NkKoQQVMbbApJ0V5uQJg0dYSCL6i1QIVYnYvuZ+iwM5yfrTiKue4JVASZMZjhS03PqEO
         vTH2enUSsGd2G8qz9q6+eaLDRc87dreioMkcSPYwPpmGfgYGQ0PSgeCGCYwvymDgsHro
         v+AbFQlJj54UMXFp9xwb4yAcF9dGhM8P2+kfrb1yFA6KCe17NkvA+RnfYQZKIgalvq/9
         rKhw==
X-Forwarded-Encrypted: i=1; AKwUvBw4IYwuD8A2+Eq4tzIBouoRYqPoocg//XHx4wZ5wHUZs9vajECU8kc6AbYmu6ewAPplrNNusjXI4CQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqdIcIVZd+2GHIXPNwhF/2N5kTr/7JSrm2qd0752GIYf6HDIdB
	P7Wxy3jksyOiLbv9DE0emy81RC4/6W8vliLySh35MZHe5o9nLJlprO5P9H5CE8+BIBE=
X-Gm-Gg: AYBFou0+JtKrWKUuNEXuB8TY+QFttM5EYvXd6osD4Y9a8C3jbwEdwaUc1poWGX26tsg
	AMEUkHXkdq2mKacDXxgBON0aieWP9CbCLaKb5T/WsU030uilHP1YZ2vbERdoub2Av6ed8jueSGs
	hp4ingdZkv0TbBurUJlPMYQB7ULlpI+IT6ttsjp0UzEdK6cfH9GQVjCZeRZqtPvoqlaiAVV6Nw/
	UWMRnfVH1peE6/xyoL5nq5WmC2CX+ahJMBk75lxjT88GfAWkvWrQdhmqYiLWQV+bDIPdI36kCd1
	k3KeohnBJMsxrAlThYJV49ps+QP1hlrA7SY8AfQArLRoK1cnCdCkQP7+QF827x6tmE6dWbvZca2
	0y8zsn5Q36iQ/Cduc7qxKfUJ7tT2qdpR6fSoA2jIWvDrYNGm/CN6Gp6hBU/aUYRPiJ5Yk0wnLID
	1UjaRcYiQF47fEwijGiC6H3zW1KMwHuYiGq9SJ1kMALLqZ3wNvkNl9xqG+21kxnUdeyBmDn64nl
	duqC3zCf4pvlpG0BbSCxFLiQYSJ3qfN0MxBCkDHiScF9L26cT+2rsfrvR72zmkGRzImTrawvBwg
	hoyFnrsYOti8Ar0PyHDhGpPLWbE/CobxtDzW4HG9d9CLzHr2U2A91+fKIyjKNoMy6EAyKyPZgj+
	dWO3Up+6f9C5G9OoZkeXumVySaA==
X-Received: by 2002:a05:600c:b99:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a966c4113amr58228835e9.20.1793202853801;
        Wed, 28 Oct 2026 08:54:13 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:13 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:52 +0100
Subject: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
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
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=1025;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=2inYdETjS1/0iXkUB93PtZKo6J17s5dPHUL/VIsncwk=;
 b=KfKesliDrKOJaJsoOLl5wvIYXtdqzsuOVACvkkiMCyuQmRlW4wxObOxLKTb+dw4dQDl5pQ8+0
 Z4Gm9Vpl6RRCP4hfAcfJ0BGifdHJT5goKzi/vMLGlxR0ldewux+zQFt
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch adds a new clock alias for the DM816x system, mapping
'sys_ck' to 'sys_clkin_ck'. This change is necessary because the voltage
management driver searches for 'sys_ck' in these systems and fails
without this alias. By including 'sys_ck' as an alias for
'sys_clkin_ck', we ensure compatibility with existing drivers that may
reference 'sys_ck'.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/clk-816x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
index 3b8e483aec92..fe6f66fc5a05 100644
--- a/drivers/clk/ti/clk-816x.c
+++ b/drivers/clk/ti/clk-816x.c
@@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] = {
 	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
 	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
 	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
+	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
 	{ .node_name = NULL },
 };
 

-- 
2.56.0

