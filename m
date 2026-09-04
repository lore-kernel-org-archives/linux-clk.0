Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2E3D6662
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509552; cv=none; b=uNUXCptji5vOnK+mR5mea9CP4DWOCWbFBYel3SfiE1ca5ztPxs3Xo0RiYsm3CxU+c4p4tdgK5cdna/dSD7P1WmbrJUAF2G2KRpx2pMd9gdFdThskAW7omhw+6ttBDvsZElG99GTon+lRaLAW/mvYZaV3wuUJGNyO5zFeKgb6wSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509552; c=relaxed/simple;
	bh=vpR0KuN+ln6lHcQtjSULttF6OUz2pD2N1HwMAgl0w3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AehvhTV2e3nU3ScEx8wO2sj5onbgnVZRgZUJ4z1BeDhhq/3+FMKf/1bnKlO32jIwmr24Y/3Z21pWTpwZEbSfSOvJPH5wGo7cuzITSuNabJWABk/a4a5ytMTkg5ddBglEgES9jCDMQlnksU3we0iRGEOAULJ66j6utCX6hmj0M/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YiiAK3In; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YiiAK3In"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso5532005e9.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788509547; x=1789114347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjS/Wss53RdL4gmLmah8vA+JE9KhD5i1oEQt4QZujmE=;
        b=YiiAK3In/pYBUhXuXs6yquMgzIYulL94kdCAircHmsK6/nI7GV/F7qHJnNVyvfUwul
         gY3HBLcQfofcKUimHWXcEYWvVQ5wssgxIaD4EgzFshOhNdulwqzb79cR9QoW+XIwq7GG
         nYvMladQvjdMlKN6K6scj4D4lMz6mQLKxN1mL3iiBLbubdxT094IbaIqH2DzlAUa9PB+
         VWstPU0RgQZSxCwyhKYmVWbIOiFki3hW7H23iKVqFdM8tdLqUiaV56WZpATJZ776Wpjm
         p+37Qk1m2a6EP+Jg4WOC7HMAORvnSDu1fJdMqvqWYJ7VPVQx5YkeAh0ZScjoMKcAZVWP
         GfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509547; x=1789114347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjS/Wss53RdL4gmLmah8vA+JE9KhD5i1oEQt4QZujmE=;
        b=RSSEGOTsaOKtdUJMhRgMS19xG7c0lC3xDfo5hVH0y9PZk+GVhFcyVdJxCHEd4gkFIF
         42+mcqO+EP+biLqcOjuFYQqC7VXqRjnJPovgXNuFa9UxbtU+J61B1OzhNjeeWZLPgYZX
         bCu4hJff7kcpwuelrdftKCiAKXRTM8/ejV/1bzUzoe0tOpstTQLCttw+6vfBP4MRRh38
         T6PnMEScPxDfhFH2t2EYPHd2+9jKqd5JlYOOz+XlPdWpNCr/HLzkCbJjgAE8INQwy75q
         CDMPe9xZ5gfp4RM0PLFAQUmIKFD++YhBzERTYTbcaR+pGfCdO4FBiHR1ilNz5rF4vFbB
         lXUA==
X-Gm-Message-State: AFuF++muMWZJ0SQEPwxSujdRQTuAuRTmKcFZRMmSBbrIiUE8e8XJVRbN
	AhP7d8cS2WEh15q0cbHceY8jcLL6oVKK35otU0NvdGluiikqe7WlVlNmrn+4lnS8tuI=
X-Gm-Gg: AYBFou2lzmx0atrSBnFvnkGJnHjb9TQ/kpN6E2/tF+O6rJKt7SDcy0zVIj1rYddOjYR
	APhbHUBu7ZUXUwd3iCwZVF9MIDmJhZb7FceuC8//Jdf+ecSBJoNvoumMBfV7w46VtYNzykkOuvI
	p1UAB4qgVIIOOerUEP+PM4NPQ+Zngj9yDMX0aAGNNHCCH7xAZDt7A/UTjTVQ2loIVmoPmQyLCGC
	ONJxgtlRWtnDV6XAPQr7a0idVzptPDB3ckdKL9Yl5rdkH1u4I5Gxy2YUgnYfVt1PRXIthQJDI3Y
	/Xa10WYfj8J5P8wr4lhK55+RLzgP9EDNaCV5xlXPrix1MHQ1dgubxVdotvK8EGORqM6iTecDub7
	pAZ8ULnSub6g9Na39a7pNxNjbIbcbvEGQpn1xtzkDOoD5p3tLwa8s0ChQGLjusTdOBgA82a7Ba/
	xzmLIZPUxhU2QiUW+ZaooVPZyOGkQCDq3nmX0hi5gR45WHJQR4oy7MlsXmoZAjjASPLbIcQ/wXd
	49FLNo=
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49cfa20cd04mr23123115e9.18.1788509547190;
        Fri, 04 Sep 2026 01:12:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm11446335e9.3.2026.09.04.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:12:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: devres: make clock cleanup explicit on failure
In-Reply-To: <20260904080129.A84381F00A3E@smtp.kernel.org>
References: <20260904075026.60793-1-work@onurozkan.dev>
 <20260904080129.A84381F00A3E@smtp.kernel.org>
Date: Fri, 04 Sep 2026 10:12:25 +0200
Message-ID: <1jld9hl9jq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 04 sept. 2026 at 08:01, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Replaces devm_add_action_or_reset() with open-coded error handlin=
g to pacify a static analyzer.
> --
>
> commit f91fcabb46a07cc1fa1a03a8bac1f236304fd974
> Author: Onur =C3=96zkan <work@onurozkan.dev>
> Subject: clk: devres: make clock cleanup explicit on failure
>
> This commit replaces the standard devm_add_action_or_reset() helper with
> devm_add_action() and an explicitly open-coded clock disable and unprepare
> sequence on failure. This change was made to address a smatch warning.
>
> Link: https://lore.kernel.org/all/apmUPdYtdIM0dQbF@redhat.com
> Closes: https://lore.kernel.org/r/202608090025.dwxdfqFr-lkp@intel.com

Note that when you are fixing something, it usually needs a Fixes tag too.

>
>> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
>> index 4cc3863bd7da9..9ed9a7b7b23f4 100644
>> --- a/drivers/clk/clk-devres.c
>> +++ b/drivers/clk/clk-devres.c
>> @@ -123,9 +123,11 @@ struct clk *devm_clk_get_optional_enabled_with_rate=
(struct device *dev,
>>  	if (ret)
>>  		goto out_put_clk;
>>=20=20
>> -	ret =3D devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
>> -	if (ret)
>> +	ret =3D devm_add_action(dev, devm_clk_disable_unprepare, clk);
>> +	if (ret) {
>> +		clk_disable_unprepare(clk);
>>  		goto out_put_clk;
>> +	}
>
> [Severity: Low]
> Is it necessary to open-code this cleanup logic in
> devm_clk_get_optional_enabled_with_rate() just to satisfy a static analyz=
er?
>
> Replacing standard kernel abstractions like devm_add_action_or_reset() wi=
th
> manual error handling to pacify a false positive degrades code structure =
and
> reverts the benefits of the devres pattern.
>
> Should the analyzer be fixed instead of open-coding the manual cleanup
> sequence here?

I tend to agree. If we are missing something, please ellaborate.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904075026.60=
793-1-work@onurozkan.dev?part=3D1

--=20
Jerome
