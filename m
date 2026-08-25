Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18303EB0E1;
	Tue, 25 Aug 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648406; cv=none; b=JSf2fPH/AjnsyI+nsHO8Y/DIktcWwADCcsCdNqGv4O/09kjPojeGGQVeVAUqFqoL7wuYn0gqo0o25HU2X8OsHTyg3p5h464O/g0DUK4j/TREABDjFdYDj0dEC3eR4yM63FjDvlYnN7lotoPLgLg8+01L296DqjAHp+ESsT1NKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648406; c=relaxed/simple;
	bh=F73Fvp2YyIdB7u74dqTk8xhP5PK2/HutfZsOuV4tHzo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZacoHi905WPXPUxUHk02cbzhF95OethvYkXy53N1fhOiiv12u8ZWlJc/JX2JCnPY0eTbCBZ9BifrYEO25lUmmHhRCY3qP5477udjNX55QJsoH+MlRWBxc31fYliTKwbB2qMEgvlUVBuFrAKFXnxGpw30KSkjEIu0ZyRA41kbxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ikxToFWK; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ikxToFWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787648399; bh=F73Fvp2YyIdB7u74dqTk8xhP5PK2/HutfZsOuV4tHzo=;
	h=Date:To:Cc:From:Subject;
	b=ikxToFWKt2NDCPAJE2wJaS5g/8pnzAExvLGITCa9uIdrRjN6o86wV8cZqPbBpwj6W
	 djd5PjsxCNH6M2ETxcSzEJrg3h68SUGDZP/wCHFmadOxon5+nhC+kBNankt6K6ZIYX
	 yIqNJp/s/KkiPpqmDftSjY7zY1LZg65kzu6F3qWk=
Received: from [192.168.255.10] ([111.206.145.19])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id EF907CCC; Tue, 25 Aug 2026 16:59:57 +0800
X-QQ-mid: xmsmtpt1787648397t0ns5inme
Message-ID: <tencent_CF54C6DBF6CC64E627F5231BD1CB408C2F05@qq.com>
X-QQ-XMAILINFO: MiR3jSEdIFaMI2sDcbFN6lBmljgE+3m3JPUVxaK93XcPYay0LUitb63LMFMfEd
	 SIIT/KePOrUyqLfMQ4ECKt8jwdJTjUTH5uREvJTbOGj/NMdaSgqDt1NpWLoOTf+rvP/4zO9tn//Q
	 HG8Nx9NknmjC4M9CK5UdjMO4YzeQTU6hfyiPVaYNfQrDm4WOaGofYMyL4IGgReSUAnc7F233aMag
	 EGVktNe5mHUxO9I0hacDk0fF4kUnBESG4HsfLvxVVDRBaWEgAkk0vb4LPT3sqKGyA8m2D1Cik7By
	 MGpilKlRGkWPnQK61tLWVVux6CB21iPLqXR34lKj5qNOowQ4VG12/zah/mppwWGNyYMSFuBYD57y
	 7bbA6OG6iyydAOQ7CQcKm/ghCO3WcvGRt+khf0wU3MdF0FqFdikgq+KSBW+1+tJ8vokmjWciJc2I
	 VyW3KlCdtMTqCGBre6yVLrRaiffUc7Q2M937cpTManUpge9ylvE9rdhmETNTkDnWSWt/CjSrV5WU
	 8+mGcXgi0RYcypuSZZfc703Ycn54z3cYlOGOnb5uyHaLtCSw0fZlKVGij8zpxMz36tF4MuRRHoAe
	 y/xxBarKZAG1mq1kYUIdocw6HoLfHpKtBv3jNzbmDPfAobPojr4Na5Orbgy4ZvnCfjDOH2qH/LX+
	 DaoFl5ZnJzsajFtTkTPiDzhGsfPAtogk5Y6W3jEsdlz+Abfhq5lOuitPWk/wYGwsPrMwFH4E3IpM
	 CFZUKI8qNABrgnTIWAvIT0UdPPOjVfykMQpurqJUaTK1UlWDrk4fZaWQ/HQMpAVErXfVh87fFOvL
	 0u1qTDTQFWI5w5L12x+ToDBYcLbkipat5bHc0HVppZPlJh/43esyjgSCC8mneQYRJl9jned+pgLp
	 g1tCm2ENbllOox2Aj9Vi69Rh4Vjs2T9Mx4KwSTmlyISVxLxMEzJ8yZ4c7Gp1fcVqhpjk2TxXBm6H
	 6KTTj8jYGCyVq0jfnqTlmQrVCEQPvPRs4cU9UAi7d5WEIPSV2AFsotzIsQ9a2YdWfCYqtwnQPS2J
	 g2BFqlXj2PQCSl4PiRrgYXGC3g45miI1pqgbtCATT485F4Knm+QDZinCYGQO2Om+Z1/56y8DOrH3
	 RLOUo0jwbqnhyV6Oppv8M8yYzhuojtYcG97D9mOxvbBrKVKXoPsy2t6d70/zaXBhzb4YVOoY44QP
	 aLjvpLyAizXKZvdDYxjXtACv4K
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <0531a76a-32f8-423d-990d-49fb7fbc582f@qq.com>
Date: Tue, 25 Aug 2026 16:59:56 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
Subject: [PATCH] clk: si5341: Fix NULL pointer dereference in probe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

si5341_probe() dereferences client->dev.of_node->name without first
checking that a device tree node is present. When the device is
instantiated without DT, e.g. via sysfs "new_device", client->dev.of_node
is NULL and probe crashes with a NULL pointer dereference.

Add an early check and return -ENODEV when no of_node is available, since
this driver requires device tree bindings.

Signed-off-by: Yang Zi <2959243019@qq.com>
---
 drivers/clk/clk-si5341.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 2499b771cd83..9d901c2fd0df 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1567,6 +1567,9 @@ static int si5341_probe(struct i2c_client *client)
     bool initialization_required;
     u32 status;
 
+    if (!client->dev.of_node)
+        return -ENODEV;
+
     data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
     if (!data)
         return -ENOMEM;


