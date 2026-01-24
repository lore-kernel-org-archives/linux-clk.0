Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE623BD17
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274616; cv=none; b=nMpofkxaAVWLLSBdK33lTxzz824IpWJL1M6HmrLPzTLe/AN09OFQOPAIIOjRrGJMYw+FzFcj7sCf7xZO6mMwQSdqmuA82Qlt5UoSTP2A1qaKIbhdOA6puKTFCik85f8JG8LBTwCkOa7vApSQQCX5pvI/xAXpi57SBmEmFi+sj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274616; c=relaxed/simple;
	bh=SMnT/0Trui6sxVUAxHuuQnI1eYrWJHdMPmTopIKWfio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvzShGg1wmgqduHXZ0uN+GuUwT6lRf8RzZPP0KXYj+zdNFVFSjBPtuUzVacuIYZSv9DTYqK4z/yZpqAiU4/ER6+RqWHPMKvkRz+/KDp2As9NoBUM3GTdKPakmxVj8zYipRrkCURUSUkiMw4g/ix85cDK6At0yiMt20hEJR9ZhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOXZ6c+V; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOXZ6c+V"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so464462366b.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274611; x=1769879411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiTqFeAqAqNp207pw9vT4+RM4bBNWXoSddsLZdhjO4U=;
        b=gOXZ6c+Vldqqp30C9TUfAWxOIxkUx9Vt5GS1/4WiIqFsAcwQoDWPtJDEJrw1dyJl9S
         fTZOq2OhB2L6DTdstWkum0g5vH+3UAmTGsK9tj4kyRnUJweKV+SoS/RckuvudWvwRf7U
         KC4AYn3vR8U8vZwoAhCeLrNNMupnjRGqUs2rS96jTsFA7hs9cY+bn+qR/0jCe69pJ+iu
         Z07PyuS4aBYnWAvwJea2tfzopSQhdCM8gv9Nf6wxXcs9C6y15xeiz/5Jq1xIYXKEPKaX
         /Cnw+4OPnn5v9mKZUcm/gILE6u84kz5gbLZaQMCdKLqhr41MIHNsamlbCP8zwW73im4+
         4adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274611; x=1769879411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yiTqFeAqAqNp207pw9vT4+RM4bBNWXoSddsLZdhjO4U=;
        b=ev0upZx3MQ7Xx2UzI8oqd/GAuyKQbsmxs5YSiIRDj+OyzC417tbPl+U9BGN41Bhk6D
         rlsgABA3ohaJr5F/OagXJhjjDjqiUTrDFxa7+zkDEB6gMGZIMojyF4RQpIwt6pYqbOBB
         zhkR2AUUq+boHvkYHa/VPBNn8l6w0KZ5N9E3H/ZN/fgNl9CCMVZAI2rvo9HGhFjYLGGw
         ES5jDHN6SUi0a/BsbAKroe04Zcd2mDLqzzJ7SevpcFBxo0U+D6QeA1i4GL5NdS69m7/k
         KFcWfa4+k7hrov+H4KN/UHs7Da0s1shQVy8c/UsGGnnbAx4thRd4YEY+BKlv9YvVhogM
         wo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+Dc/q4Ka35LoZIBXeAns6PxHzgoINfz+Atyp0QHQyjpRRhjTaL35d7Umr7AKFdyEw1dwv20A2ZJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4A7ZtFptM1NAT1T6sVnM8TPC3MS+hY+Pzg19J+6+8RcE25Jmw
	OWJAptF/5w9ouIWO9C3FyTpoY+BpYVV5DgYFuUnVoThPzylSfIUd8zcm
X-Gm-Gg: AZuq6aI7z+cU2qSHVjvbMJxFPnmCoE6GMobqeDWUikDWlGhuJqbBuw2MgF4ugpkZZ8a
	tkd82ZNv+Tb6KtXebH7H15m01T7Tpm3E5LNjHlVgvJcfIVre6h/braTlI2dLelS5nViSKoENu3S
	/mpBjXzowxAWOtExtTJCuaCJiHg/kkTwbZg0vGl2v9NwXbgexTc33kmRunmGNU4tPuz5FbcVP5G
	MNPRr9iLPqiUw0DXLIcLIgUrGXI24eBeDqAfaadb1h2umoya5uQevjTtmsKflz8FL68cSue6KQP
	5xAjeQDqOEsbWb1npXKy3H2KoPp5uYWGkYtL1r+heonsI/AMB5rR7g8P5w0TuNdZNXzrro7c6rB
	W2azpYlx1oPFqGXpl46tNeXRSv8N8w8yV3mkqiB+rE7YMUST+by4WwA47VNQ9pYSU2Z8iEWJY7M
	ofi6CwnVs4q4uHf/mpq8SKJbClbG/+5f9zDxcWL9QfamRK7XnyoGOJq5vt2RpMeu1mFCzkcX5lL
	fUlr39k6gn0iXCt3HaEWY3mTMxWcbEnDRTn3vpvRaJiqw==
X-Received: by 2002:a17:907:78b:b0:b8a:f946:f7cd with SMTP id a640c23a62f3a-b8af946f83dmr67418266b.21.1769274610852;
        Sat, 24 Jan 2026 09:10:10 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:10 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:04 +0100
Subject: [PATCH RESEND v7 4/7] clk: bcm: kona: Make kona_peri_clk_ops const
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-4-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=SMnT/0Trui6sxVUAxHuuQnI1eYrWJHdMPmTopIKWfio=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr7W+Bmel3AdGuD8c1rB/86WRkosGRNF0g1
 wis0tzGZnqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aMmDEACXdqhwpd6pbNP/tc4vXhkp0gSfJDWzbSi7DUfOhIqUD4sClltc2rBE5oiOJx/5F7dEJdj
 jGplyVchZi3T2ovS8l9bQGAjJZlb086lrc0OvRw580NKZrx3Ua58GXCN/i6LwaoYouZSH3oj+2l
 Xn039uwHTFOuOs9JfhshiVGlhSF78pCnQJt91RsTq/MhLhfyJ5G+jDFL64+RCYtz9012WIbGXYV
 rm4XKsqAw1vwHpZ2MAvWN9bUigcs7A74/Zsa2p9oCcveLhWgKWM3a0YgBdO5RigoRD1zgkFkhzw
 cvHQVo0hDI/eFH5VSIxmuEySJHv35ctcRkwHwwPwKqC/1hexPBsZekPG2hJ9WgGp0Q6P91GOIHn
 XF+MKyl9UkJgjg2l3DCxGUY1O0TBmX80wrSn6fPnX5kwu1Seso6wyxy+MFT/rf/Jv/4bDfDRnqc
 cSIiszRni0F/UnYw5RM9zasRkEwBm2FNvEDM2RSxLfHK3sS++ehn6+WXXb42pm1AlVhCNHuAmKj
 P9oXodRmRUobbx7tZ8VULwkI9rQnQSJEJxXAJ9A8GnBId5dU09UIXf5Bs/K+k17rKvvkj4o+d4x
 MuxhyqSLHGBpI3AXg9pMmMOdDQL32jBImO2q3qMmQA9Z/tzAiOwgZ5arX2kZWUi/P5lUORse0ug
 qlZO0h9ODCX3F8g==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..2641eaa4ca52 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c..7064ce316981 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.52.0

