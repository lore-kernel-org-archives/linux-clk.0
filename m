Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653657;
	b=Zz2YDm1XS1rfDV0AP1UMtgx44sqb/8Mdi6qeN4cZi5JEsUTcrz0GCbTi5w5W/Vr7xSpM
	 u2THPvlubP+3/KjAhYRa/BAq6S1yhOd5NeKEaz88HmV6SlXqSClMiLS0Dc4E70unWrNOC
	 XSjikhiYQfyo1jmWijUK8NO2rq9PNl4m3+eu+Hv1xHijaFkXD0XYW2fth+CSmZ6WjlQgq
	 PO81eOykS8KxqsmgjIxUPTGhuFz52ogKkVGHkpDsHFITrQMl8dFCNEPJbwjydMb7FRw2v
	 80/lPUL2w8WSTzvCrZsqiVpXn/1xqPJ07MrvFfIfBJLe3EuRtjPpQfsyDmcXVGItR6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
	b=h5lp3qC+GXChXMhpIGORKPnf1gzd5yi+N31FJmPmftjlgHkSfYnQwQL2lIjpxKv3/jG3
	 Mrf7Hn3XORF7BZablgOz0ZyIs5aGAD9GSYpHpfda8glS0P+smVohVxK6EszyzzA9m4FZB
	 XkE6wDjkzWWYqa+nimeBsVXKsL6+qMdACriOysb0Q+XS2sjQOR4Pyv9NIaPg7355zUEIZ
	 X8KIgR8rXB0+9xns8a/YyBE5B2yjbDSWmBbsSTlsqh+9P89kVWxo9BAes1vWVcoyjJpak
	 iI4Y4rw6MeGkfSo18D7OEb76IYrep0CtC+lnnkOqodwOmmmekFlQt64/zByd3P7tj4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lvga68i4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B127606A327
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 21:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B127606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lvga68i4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so842025e9.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653654; x=1794258454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
        b=lvga68i49+EIGotxRfWbtJ/gVriERQYwYxYnEBh93QJ0MNdFH3a4JZdmVh7F64jQKK
         jIKqIfCLYu5pJmwZ9dRMSHeLd5nZWgyW1tS8yLOobaUw1CdNRP9hyuOEGbkX5HYW0yyu
         HzXreaG1LBXakTNKDNF3rGRG08uIruD/PN/ldh+ohFHqwcIUu6Qr9HGy9NtsM8cY4Jki
         GS8N93FZiAKkbLKXEo64mvQ5gZthujkHlsBUBHKrIX5kbFSu30M6pBNd4Iz7fgORjAhB
         1oXoivD2j1WfC7iZSbRgAo9YjV9jAPM3tu9q8EYQOMky0ECaJrsOikoLZGUYAmw1nx19
         Dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653654; x=1794258454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rb+9GcHlD1YPtY41GxHcCRkjlG1NXdFn4Ml2fRtmLA=;
        b=JpT7raJL+sOkQlMUVm3BChlzDds+ZFJPRegN8/2ERXel710XlHXHKVayQ1T3kZ0WzN
         3TdJqMY7rmUc4rbn8k2nylfGVhz8/UcH3ccHHh1K0WGi+GnYy5NC00bTeI5+f6LJSkVW
         7/QWFGiMLzmx2z24mVA/Yu5GX4i8m4TAB3MfX+Xcnzj9WB+/ltloAu4mRp0wuIPgCdGf
         9shqKJdV1/+PnUEAGljTbo/f27jB4+Tv7sff1E4qv4q/UNnyZZxwz61O5QlVWiXuhRr/
         GFZR08UuPcHh8cPIVefPee1ti3fqrbG2YrrPnU6b74r8pRWQASsXhHj3LadxQ/ZrFTYN
         9pxA==
X-Forwarded-Encrypted: i=1; AKwUvBw6nTPzKzuO8zg25qS8xWqjRilyvWbCZ3ugAGzKFPn2Svw+zN2f7Kx4W0OSVFKhMe+7dfgreBRtoTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ61dFOBrUtSRtvGD54zdoRE53Q39OfYdin5OmxQhhuR239Z/X
	vp4cx4bAtqiIgI+3h3h3ZMdQDcZbU+uR+9rPOSoDWeKijERK5XT9OVmcEU5chaRUkHk=
X-Gm-Gg: AYBFou0mnq/j0JMdlBorkGcY2VGlnZfDfHa/wMb0+O7fY5GDhly0L9afprmUx19d+C7
	M7j6S3dvTn4dpL7irWMvkpG6Nkge0LyIMTs+V6uGC4BFSTAAHhrZ2LnkI/1BZNSGREMtih0wyAE
	6FTbrWjplr3g5mKUlgxh5o4AhLIU6nNb1g9nx5eaUhV0sbS3zrtpANFSZjz7tFrbKSZxeMVS8+b
	ZeOvGXuZyAuzFP8xfVEOlysMjCRpCIDAnM8F/bDMjuO/yWx3JaX2OMPKZdvr/BrUK3DAXg6Lh9h
	o+CM/TQh9MQPRrqqpvt9jWvRDK4avawtp1DOoQz1ru8Lu4o930wX4xvc2OF9/JyruUfx/JGzqSg
	Mqkwu2LGECkxPU/v4cAUxmUBBgtdksR3MRanhYEEiTEucH8snKaiV6DBi+pw6wJZEGORgekEh++
	E17bePK4I8a6Kid0kMd+4363Ft7qmw3GcEFIMIgVDsvio20WOJGIJs6X1iHz4nit5g9qO3KvnHc
	MxKQptYTxIZty8kgC+kk92ofHcENRRVF7/A6aS2D6Gq6T8MrJE0ZGq3HPLkypJCQnLdmumGyDHP
	d1QrFp9c2MnH4LLjmi+GPEr8gWsdrvAKjLfmRpfijOIBGVGghBQyDRROqkTg1l7eGiadPdOIhfx
	F1CqiH3IwzPtVl9JpCg==
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr248630065e9.11.1793653654031;
        Mon, 02 Nov 2026 13:07:34 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 02 Nov 2026 22:07:20 +0100
Subject: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29 GHz
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
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

From: Sebastian Reichel <sebastian.reichel@collabora.com>

DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
PLL then computes a divisor of 7, not 1, for 5.94 GHz.

Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.

Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..a446abdedcd7 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -227,7 +227,7 @@ static int _div_round_up(const struct clk_div_table *table,
 			 unsigned long parent_rate, unsigned long rate,
 			 unsigned long flags)
 {
-	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	int div = DIV64_U64_ROUND_UP(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -244,7 +244,7 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
-	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	up = DIV64_U64_ROUND_UP(parent_rate, rate);
 	down = parent_rate / rate;
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
@@ -423,7 +423,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 {
 	unsigned int div, value;
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = DIV64_U64_ROUND_UP(parent_rate, rate);
 
 	if (!_is_valid_div(table, div, flags))
 		return -EINVAL;

-- 
2.56.0

