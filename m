Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA739E176;
	Wed,  9 Sep 2026 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929033; cv=none; b=ZAzb2dpnCV8S/hdS2emZabu0lWMQ+HzeumaRyFalxcFoEIWbZ3n8mgUmFr759od8r0jPW8i8RYTHzuwyrBNrNoychjxdGJy0LK5uqEzW6FD+F1GG/kApjQfrQttLyMtZ7TFCB/YcYOIkhBVM9f+NxcjX1rX2A5tD+hv9HD5s4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929033; c=relaxed/simple;
	bh=yxAt3PlSqUlQiqn+8k0QYBuAiGauP/Zz/z6EAf3ppgk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XO62RVoPwOKtFZ6mUKFq0cODKMAMD4mxwYhOQfQorSrDEdOtqNFw1wAS/TAtq8N6TQBepbKG8dpmms7YjXBM7dO+A6Mnxvw8SdRf3qbITudobvV6/T2FH3dacZhRVOZBCYoayhUOSTMeAV7BBZSoq2FgV872CSUHiiu8RKAq+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uWUi+q+Y; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uWUi+q+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788929021; bh=NN8Zs7o+RVvMVzRrD4E/zEGWsMyj2EFFgU9lxKlMsKE=;
	h=From:To:Cc:Subject:Date;
	b=uWUi+q+YJq6Q9yuM7kDX+mgVU7YN7fVu/MrFxHt2fB/trEnjqAD+QsqTSsA4QceTx
	 4V0f+SalTn3KCAnUfF7/h/sjl6P7c78rUOSy9ziH02Mx74fcHTxBpBMJBE7Gb5lx2X
	 D3RgpWAR49TR0CjyEYj1bwdKoTKHZ7uCGP/xeSBo=
Received: from LAPTOP-7R15B00L ([183.220.99.26])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id AE60008D; Wed, 09 Sep 2026 12:43:38 +0800
X-QQ-mid: xmsmtpt1788929018txsas71sy
Message-ID: <tencent_0D58C9974B2D7889109BACF393650FFD8706@qq.com>
X-QQ-XMAILINFO: NhsePn6g3vMqfRExNpLZnAjNn8F6qIabxPPXtvvG08qkt/0dxTDvrxFkH+njUO
	 Y7gjJwbl+Oye/NnnsZ2DbRC6OKEsmSz4H7+xgif1i3wcFanV1hrb+k2TlkP0ftD7FimChyL+zQpC
	 si/Geeo2mjyZs0WxBH6FWqQ4JLcsgUnOoE9B8fvpC3YLa9TaGyyuhSX7ybi9j7a+gq1jRe4hyjz+
	 z0zoShdfCxZj6X7N7HjjqQWol+lquPsV0ryfuQhhTk6cZY8Zi2fXnqyHqAQNWXEDsJDgMYHpUjsY
	 YI6mJdXr6LqWb9ki/a0X5Ppaphkb4z6Jk+g9hiXNBrqvSVpGPGizLLZ8L89DokpqfG7naiNDyB5Y
	 M6FL8SBTXLDNYtoEn9BdwpvHZPULL8pV2ssC5OM+gNrjhZpsltEVD3dlCLAdLKtM1Ut5fvouRC2v
	 KU+/CsEoLkfeWTI1hG5b33E7ZzZL4E/3KsoNSGwU3JIYjyhbPRPM6tbI7JKmZCL/hhu83IsGZRQ4
	 crm6CaJgqhjVUaQ9vE3NT3Vrxt/rzUA5B17cPFfs2K9h7v/kIKllD7TTnQTOWEcCg+GjyD385/G2
	 SHUiXvrS3PHqJjnobtWLQBmkIJXDEwSgKQJiw8FHrY/8hc93HSBi7emaRlF0own9v2PMfEByHQDv
	 TGgqXAukomiPBkbTXHeoChLhbE7P+X42g5D19V5ViQma2P7XlLvLssrbncbQPdvwznXKtTjpyhdl
	 zVUQLhbjeCC4KlAlUlVeNA4TD05JdoIkUR+5TwgTJ9iFy66SFIxgwF9gQ0K1Oyhk2u167KI/Kvz0
	 S3vQpCn+XfjhgLU4IqtqP0dkt2evWaKi5so4bvJZJ4JiE7MbROAB0t5APVsU9LbibmJrUwtOz4uI
	 eYDlRL5pqmHvNfjlWbqPTg3XlaSlR+S6DgtGIBi/LQ9xjaJ9/ipnvLPfVD9mkR/3z0LDy00ut43n
	 BzddKH/8EfomYut1C7sVDl31bLZAb3C1EocoEpN19nI3MmbvrapOuyBu9AK0pcrwo103Gt/WBKGE
	 XRQAkFcANFsGgArTVvLvxPGUrxBhAPIZUIOV7D47lqYpAWKAHWY2VSCSxGWBsFYzXxUEKkXw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: blaze <1466528493@qq.com>
To: kernel@esmil.dk,
	hal.feng@starfivetech.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	blaze <1466528493@qq.com>
Subject: [PATCH] clk: starfive: jh7110: Fix clk reference leak for pll0_out in jh7110_syscrg_probe()
Date: Wed,  9 Sep 2026 12:43:31 +0800
X-OQ-MSGID: <20260909044331.579-1-1466528493@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In jh7110_syscrg_probe(), the handling of the three PLL clock outputs
(pll0_out, pll1_out, pll2_out) follows the same pattern: clk_get() is
called, and on success clk_put() is called before setting the pll entry
to NULL. However, the pll0_out branch is missing clk_put(), unlike
pll1_out and pll2_out which correctly call clk_put(pllclk).

Additionally, when clk_notifier_register() fails, the error path returns
without releasing the clock reference, leaking it.

Fix this by calling clk_put(pllclk) after clk_notifier_register(),
matching the pattern used for pll1_out and pll2_out. Placing clk_put()
before the error check covers both the success and error paths.

Fixes: cc46f7c9edc4 ("clk: starfive: jh7110: Add PLL clock source support")
Signed-off-by: blaze <1466528493@qq.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 0000000..1111111 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -432,6 +432,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 		priv->pll_clk_nb.notifier_call = jh7110_pll0_clk_notifier_cb;
 		ret = clk_notifier_register(pllclk, &priv->pll_clk_nb);
+		clk_put(pllclk);
 		if (ret)
 			return ret;
 		priv->pll[0] = NULL;
--
2.43.0

