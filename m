Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E88443BDD8
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494836; cv=none; b=lqI/2OgnkcczxqkHXmD93ws4z6FKMJ5g2Si1o1ssHYjBukB6dKofP7PAFFpKFfcX0Ib3HnamJBdZNY/3RM4BLXlPfyscLfLhrFOB0W+72Rt+SDUc/AjpugZv5iXQxHlw6TN4pjb9F2/yAONT1HDROERXZktBYNITgGajvycp5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494836; c=relaxed/simple;
	bh=ZPw9lXjYo/re2jHD+iFfey94YnYwBpvO2yjlzKfJ5a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaWWlrX1SWM1+wu6FMsEAbs3KOUYIvV0Pr3BftLfIKJdLpmZQARhJgX7J2bcAz95sikWXmopmqdipIXcEtSt1Fid+Lwa/32A8PQW4oqQVqvfoCCi0jD6S8MpN7YL331W4PEtvtIaKcwlhZoZVkQ1Jh+L0jZAcvK7sXq8Mayj2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WofBKwCw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WofBKwCw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1952688f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494833; x=1790099633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BybWH8gs7AYx6NYtOuIpbkPfpLYOJ4rtoku/c8ai57E=;
        b=WofBKwCwNSdMlTXmpRv1DikVuHubhNqSLE6T0xj93cizQ+zmGuG9iUqCLsokXd2IWK
         PAB1UNcb1WZ9rVyeYcyooz+GE1Ywpt//RmUi7lVEeZK+U6K09jT1abEkbMA114o2EB1Y
         7m02fkEaR4ZFPJqB/vQCCbNsv6jvMnw1+mLxUGPN4scVtVE26QMtGBTztzQKJSuhRgW0
         S0IXMdz8gTI5nucnRSPPXjUpGLZRbkRiLF4A+xQEES29IEOIo4YQUH9E9bLBKOFnyEFE
         j28pw23qzneooFneoO1J+A5h+wr2yHX0nWWJDPHvIEAC+Wa2x/0O52IjJBIM2AIsPDcm
         JtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494833; x=1790099633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BybWH8gs7AYx6NYtOuIpbkPfpLYOJ4rtoku/c8ai57E=;
        b=Xaa5f5dLFPiO7QQRjXHh5NtagVexLLiCurGLK+Ba03RcxJzM1XoSPQkYDTop/wu0xz
         K8GOrJF2yCy/Ne92XlQPyLCtzAelTK+oZlS3Nshe+0C9q2/aHMfEkpo0HbYZekMhsknv
         I2MTQNTLEDT7F2mgYqf1BQ6rGm1w95FY2Eftx1kGrqfzWbyOP4YdvO3tb0KaKLi40y50
         idX1tRCNQXskcobAn2Anvoe/N0nhj2z/3qyB3Omb1Ag6DYKnyXL7rgWHo21AgmIpTDZq
         hbFJ8DB2vktkveUwPhGLGN9tdeChxrziP2/GfAOaXq1/TClcme9VUjC4jrKOMDwYMr7p
         qyOA==
X-Forwarded-Encrypted: i=1; AKwUvBxnX+w6elSQ1PGS2c11quLi8LY7ahcpO+SOo3s5dhytn7PMa15kaV/zW5oeV1sXHDZbREyNRllo984=@vger.kernel.org
X-Gm-Message-State: AFuF++mpLO/XGYv8GysMP0rMyUjS/Z9CEZFEFPXeUzteFx7fnk0gscDa
	T87NYGcnk8LElVLFyCgHBjCSjlgLOldVCJcIVtetoemUkCwEmOfg3RAM
X-Gm-Gg: AYBFou0KQBApnypXn75llqrSV8F3EGIPyO9Rn2ob/xoEXmZTE4e3C1swWIxV7xZ9aRG
	ldhxrQOoemfDf+zrLExo9BfO0uCLP4VjonOe/cpBTlHOIN6qawwqBogc7CPvt3TZZ7K50ierZUR
	tK2XbGizZx0t8uNOtGGh8FW6kU/Lnva8+BfAW+6eT9FeTrjhIggFGc6c7L3JdegPOD3v1up5dlq
	z1jfERm2/kjUuAY/KVuY/wLtbi5piClCOn/X0UrHw2XJiO5s9YW5RwPVlgbje6bWyBCQmM62tkv
	l9xka2Rr/twBdPU/SQv+onZIZS/3OTmD9Lx6s50VfpKMQfbTDWygcOAGt80TFC6jc5rpeHIaEIW
	mWOY9YnN/nhjwrjiUwItuURo7ZQ+8NRhBsju8Xq6zL9NYK8n8g1pnteGR92TMHFe5HW26x95wSq
	hGW4Jvbcf3JQRzgnlhXWXTOm9Lbd6+9D99SxRy0UI5kMTkBuOGphwdsHWP0VMBmuwZquA=
X-Received: by 2002:a5d:5f46:0:b0:486:faa5:2165 with SMTP id ffacd0b85a97d-48702b379c8mr9832537f8f.54.1789494833029;
        Tue, 15 Sep 2026 10:53:53 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm672288f8f.25.2026.09.15.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:53:52 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:53:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <aqmGLBRaLwQ5GpXS@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>

On Tue, Sep 15, 2026 at 07:38:23PM +0300, Dan Carpenter wrote:
> Callers should test the return from of_clk_get_by_name() with IS_ERR().
> The function returns a valid clock on success and an error pointer on
> failure; NULL is not a valid return value.
> 
> Document this explicitly to prevent callers from treating NULL as a
> separate failure case.
> 
> Assisted-by: ChatGPT:gpt-5
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> There are a few other functions which look like they return NULL but
> never actually do.  This is one which has caused some confusion in
> the past.

Sashiko says that it looks like it can return NULL.
https://lore.kernel.org/all/20260915164913.597D51F000FF@smtp.kernel.org/
It does *look* that way, which is why I'm adding the documentation
to say that looks are confusing.

It's pretty normal for these types of functions to return an error pointer
for errors and NULL for not found, but the of_clk_get_by_name() returns
-ENOENT on error.  https://lkml.iu.edu/1810.1/06936.html

Also in commit 6a636d203cc8 ("clk: renesas: Use IS_ERR() for pointers
that cannot be NULL") there was a static checker warning because the
NULL return wasn't handled and we "fixed" it by saying that NULL was
impossible.

regards,
dan carpenter

