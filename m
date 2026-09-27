Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A232F7F01
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524983; cv=none; b=U4GxGQEcs7Exu4T+/XZvkOUWuerQZZI85aMA3pFusSG9PUhozQWCbjPJR0kVy2GY96QEQsNtGPti0qr7Plyo2ug/+uROxHSVcOSi68bQMQANlB98GK8ynd8EYr2SANPFHolfs1aLudgAZSakCpC5RbVXjVcMu3f27dGL/2ZCoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524983; c=relaxed/simple;
	bh=hjJUFq9Qq27SG4MmAUZ1qN1fAS98vkbO3WcGCKh0AEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t+g3hWZwNF70N47wiSrMV2ewxwn5PIW3kWd3nLdRCw/X2IcKyu+FD2b1x4BkYrcQ4lv2MMjME9W+RpAJyjeBg4Dn302cTek4qNh95l6lBC1cyxdKbe02CyFMVh3AAKrZECABPiUxB/jfviozG9yNtnMU6qKmUCb43kE1aiMRHmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O7HeAZBU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O7HeAZBU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12606825e9.1
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790524977; x=1791129777; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYQzv3XnB4eGBczMg+RylH9SGrdqjENMMi3iqbV4/zU=;
        b=O7HeAZBUdpRb1PYmn5POk3hYnnDGazF3h1dIHE9FIusc6S9+IDkb36d3/iZywr5isa
         cWjodYa1Y6HArOD8Bf0Xk62hyW9VlFD7MrHiCiF6XA0WzWvTnhNKP/5x6Qa6uAP67cGi
         Fvs3Mvi+MQ3m/WNT+ZnY+iViGUlymzXTjms2l4yQEg1cNQ5PuvEFuMW1vQkjj+faiWbj
         ZsrbuNhoGreIGCfd+Alx9CjuKQd6b7UXtlmPxSahm6ARQKolJgXp8lIURandfVWpNr8n
         dU0wJjkkDFXyOR092cuaAx8I8F6JaOYJqDh1qfgPMkJKIyw6Jx9Ku5Lt2BydmCiHrgJo
         ZUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524977; x=1791129777;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYQzv3XnB4eGBczMg+RylH9SGrdqjENMMi3iqbV4/zU=;
        b=X/pHTvjFl+T2srDaHJDT8aXJNl3u1hn6vcTF5RXCbWU2wJXPG6OHSGaCmRsSg9FB5B
         T6CyxQ8l4IOj343ctZWBGuNQYda05i6fj04nABiUUeAchKpwxAen/3hP9hisjjbEhUAr
         vevg6zZ4/WtmTAS13JH6xIi+8y672rCUEvykep2gnsk+MRWKbR52EGKMK5z/+I3uag75
         VOLSNH+1fHFlbCeatvCDmzD+Q7UXON+IWLJkXFBs/r0Tysl73MAgjIgpp8sZvRkpee3B
         vhnr2qGgR18Y2fICrNG+axLmKDx+7obOPNlzhduGFVy5unixIm5I03uysG/zx+rOE6NG
         Gl4w==
X-Forwarded-Encrypted: i=1; AKwUvBz1ch6Ijt/IhUqZs+Ow192qusv9y+sbtPYaUXHNYs1iD9Uah0r1vWiAtua4zuXWz1IShOoez9c379I=@vger.kernel.org
X-Gm-Message-State: AFuF++kcEIBZ+THPqOWeJoep12eROwReENKqX9H0dGk5Ai8iRrgR6I7Z
	AEpspPJB7lssvlQvv4PRZInxZ2mtAlsw+lG0NzTK/0EUcxqpeDntpPK2v7KBiPl/Kt0=
X-Gm-Gg: AYBFou1H31RjdhmJVO95S4ZzXKRNPLUChOjsGUopt0pUGLTXUW3zkNFked7eh33pDb3
	+SKANNRCmVjEPi/ZZIetHgB87BmgPsn0jwBRkfz0FASUvoI+Vr2ZFOubqRULOF+ZmK3V46VYhcn
	QXCdDSV/CeUZw9ykZ+fVAgMoXbxLeSfg43e30SbNcts5UHmUf2/0yk1V5YRTE9oFEBEVsn+fB4w
	NjEvVXpV+tuusRotZ93PgfLUXOiMOcQUjGiwa2AO5lCAM/LREmTfzUQNrUrMdvO5fE2DcYPrVQi
	4yqf7wBEKy91dP5j7u8pLbFi1XXSdGk9eJSfPNKA7pFUDu4LPdBO1RRILNOjTw3n+EISpprRX4R
	3y8wg63nVHWxPLcIF4/lGhtYjrZcmpmqnBBvpueekUZZlsZT5O0aIhfJiKTtuTJ8X0YsCFm+uBw
	DuweeCocM5tS45oo9sqDvAczpPgrGve2nNyTU17EUcRV/XUGmQFCMLWjoNvh6w/Bdk5OsfU198S
	ciJAgNrrUGB4lckXg==
X-Received: by 2002:a05:600c:8b65:b0:49f:fe7e:dc61 with SMTP id 5b1f17b1804b1-49ffe7eddc0mr51807745e9.0.1790524977389;
        Sun, 27 Sep 2026 09:02:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm65282445e9.14.2026.09.27.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:02:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>, andy.tang@nxp.com
Cc: bmasney@redhat.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com, oss@buserror.net,
 robh@kernel.org, sboyd@kernel.org, lkml@vger.kernel.org, Wentao Liang
 <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qoriq: Fix clock reference leak in
 input_clock_by_index()
In-Reply-To: <20260915042829.1725639-1-vulab@iscas.ac.cn>
References: <20260915042829.1725639-1-vulab@iscas.ac.cn>
Date: Sun, 27 Sep 2026 18:02:56 +0200
Message-ID: <1jik3qadhr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 15 sept. 2026 at 04:28, Wentao Liang <vulab@iscas.ac.cn> wrote:

> input_clock_by_index() obtains a consumer clock with of_clk_get() and
> hands it to input_clock(), which only uses __clk_get_name() to read the
> clock name and then registers a new fixed factor clock.  The consumer
> clock itself is discarded without clk_put(), so the reference returned
> by of_clk_get() is never released.
>
> Release the reference with clk_put() once input_clock() is done with
> the clock, mirroring the pattern used by of_clk_get_parent_name().
>
> Fixes: 80b4ae7acea4 ("clk: qoriq: Separate root input clock for core PLLs on ls1012a")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

This is PATCH 2 out 6 but there is not thread, cover letter or other
patches. I can't tell if there is a context I should be aware of.

Please check how you've send this. Consider using b4.

> ---
>  drivers/clk/clk-qoriq.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> index 2524c5c0eb46..2ed8f93bc861 100644
> --- a/drivers/clk/clk-qoriq.c
> +++ b/drivers/clk/clk-qoriq.c
> @@ -1135,13 +1135,16 @@ static struct clk __init *input_clock_by_name(const char *name,
>  
>  static struct clk __init *input_clock_by_index(const char *name, int idx)
>  {
> -	struct clk *clk;
> +	struct clk *clk, *ret;
>  
>  	clk = of_clk_get(clockgen.node, 0);
>  	if (IS_ERR(clk))
>  		return clk;
>  
> -	return input_clock(name, clk);
> +	ret = input_clock(name, clk);
> +	clk_put(clk);
> +
> +	return ret;
>  }
>  
>  static struct clk * __init create_sysclk(const char *name)
> -- 
> 2.34.1
>

-- 
Jerome
