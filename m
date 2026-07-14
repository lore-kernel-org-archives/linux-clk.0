Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB3446856
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044228; cv=none; b=BvXIoSp1mispGJqQ8AN7NY8amZo0tj1mkNYakUEUknvXYZ65OIpudpUgMXc1FcqMLX7TXzoaZ1dhAzLoDAMCZ/uWu27PAhX3VL8hsAiYiPkGwAOOXmUm8B3uI69q/q1e/SLEnJlkA0cF3qxUJ8SGZfIfXnOVdbK5CrxrRzQdE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044228; c=relaxed/simple;
	bh=HvolbyoBY6X05ttoi+SK7pVHAyLB/PfNOG8NaEtuyrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSB2NSGqmEtp/rymkgLNh8S/gkQiswLc9hNPgRIbbSNFrOKNsOL5e1yYeL112NQVUZpZQIbb4F5Zr5nmAV0vv4wepNIBnvzGf1ktneMwVE+ebUO03TCogZqS+dCSBLkJ52P2tYb2E0ozYaSfXbSegd/TX03HAjK1iZSRR7uWFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT+1F5IY; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT+1F5IY"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a376ad8fc0so1507117eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784044226; x=1784649026; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64SzPGE2xoqq8LCPMxKpT8c3wPEFcVPzYJmlW4gXGCY=;
        b=cT+1F5IYdnYo9EGyR2ciJtKcxp2JWNXuUj86L5DlnhDd5DOvLIx2xYDmtPvOOraRkq
         woIbaQtXqYXyHhxxdC+UzJujeungombnhcBo4eIibhNYFog/vxRe+damcEyqO5c/YbuG
         w40YXLX3xzzWBToQmGXp2O5OfR3Pa7gK00xtkXHUjKTtjg7dxhSWNlolITwa9f3qxj9g
         HEnS+kYE1992A98vpjAZ++IZCaHGdp3J+5wsCxghLvNMcMwQzf7ePN7LnIs3ggJxQZje
         K5GzX4dVEXH81sSnj7qHN4TGPnav9w2GHw8cjtzPaohBuUbmI4c58SDpTh18+b5Ly18f
         gSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784044226; x=1784649026;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64SzPGE2xoqq8LCPMxKpT8c3wPEFcVPzYJmlW4gXGCY=;
        b=YaHhajuYDG3gVZuiyXFSCJq+/kSmoYKmvZQMYg6qimFZU1q0R5gu2FJXxXotGifRZS
         mEctigbcHFk0cIxKe/OrZtFstUXJnxGlKb+1wHNT5MTvP2CAVft/vhl9FMGb4LYeUcNl
         hH6paLVm018bzM6Kigu+1fnR0D/iKaT5xWhzDEaa0ZBMA9/7Hco5P6GNRyrEo+03S5+J
         2YgjqgxmOd4Hes0IrbRdUhoVzluVZIgzArEcrUMzQLunjjsrPTQ7Sb6rnhYohxHQZ/Ko
         nAiH9B0u1/nMVe3bWiD9M4/5sBv+zJbQl+C6z3kLfgRvO3S6zrBZ3mlh/cyDxrmfjmvM
         8LwA==
X-Gm-Message-State: AOJu0YxwypGJKNW/hy2EFDQe+l/WqjsYQzY0uRVtCBzKUhUCucFL7yCh
	9B2HjjbegwfyRmnQfZcrTD76FnTMvAtBkGgYgGWH3UlTv/2tqLMTHVd5
X-Gm-Gg: AfdE7cn/U3P8QZ52AzOuXNAl5eXx8LQIO05u5kmH/emTHd6kLvGnmZmj2fKtcEHiFli
	CnkQUVu1Lvdv9UhD5T0OIaHyXbJXFE+nhxhJgk+DWYMiIf0U0MaVjKmxtZ4V5liEae8Ts6bQ1TQ
	Ow30wzeMN2AsXI8zstYwfNMV2BcMi3q4MONQnbsqJsnZUQYzjvMAREIOyN7o5ozmV9DqPLbyhmO
	3/Qd4v1aGKTevMrnJH1cBOCJ1TvPVl04ezzfIxYnJJpR26+ruSBmOBICIxofgpXXM4YHXJMNGEy
	OL7sEc5VrE3cIASjm9i6cvjtTsNoXyZMgu5tSeZF0cpIhiFi3A2u/fyR895Wke08DD53T/C/bAd
	0lUm3kVRI/zoshYv7eUN4fyk5Uw0TVgwvKvnWE74AhfCHUd1qepbhOTGL5rGh9vykqcaBdFXxXz
	88+yYO
X-Received: by 2002:a05:6820:60a:b0:69e:41bf:fdcd with SMTP id 006d021491bc7-6a39a6e47efmr8043091eaf.38.1784044225906;
        Tue, 14 Jul 2026 08:50:25 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4546f12a6casm9146457fac.8.2026.07.14.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:50:24 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:50:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: [PATCH] clk: document that clk_get_parent() returns NULL
Message-ID: <alZaumcBpsRS9tyS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The documentation in the clk.h file says that clk_get_parent() returns
error pointers but it doesn't.  It's also not consistent with the
comments next to the clk_get_parent() implementation which say that
it returns NULL when the clk is NULL.  Update the comments so they
are consistent and accurate and say that it returns NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 include/linux/clk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..aa93ce1fbf37 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -951,8 +951,8 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * clk_get_parent - get the parent clock source for this clock
  * @clk: clock source
  *
- * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * Returns struct clk corresponding to parent clock source, or NULL
+ * if clk is NULL.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.53.0

