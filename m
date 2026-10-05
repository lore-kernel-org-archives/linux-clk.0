Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A8429814
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191227; cv=none; b=hTzZDoOjTOMz05DoQUIdNrI30Z0nXG9jdfEaP5+IimlDa3fb3tYlXm+MhZmWxQec0snRZokZ3O86Bf16NC+J92eECuRqndcqIvXsx5nnpb8j4WoMS2EF2OgrLJyYhYQiTDCV3wj7xAThClvPKm3UWojD2zYaoNgfT9aTujlIfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191227; c=relaxed/simple;
	bh=AcOLGf4v2rbS8shGlvVPEN+rZjREDTeoRFP79D6hClQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NEhiHl0egu4c2J3RVkPypTewHe0UVVSR46Vt8k6N7NpPtLDZMxpvKJfgHZp9NaB1kn0X17+bGUYrfL6gugs/0/Hv6CFmT45Rtu3JPtfhgKxKqk28BQmXw5TPwYzxp7q0c6isINeKJOCkLKZnmRH58li6BKTk/N2GPxmMEFFl2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Br6lWdax; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Br6lWdax"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ff680331aso14989985e9.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 02:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791191223; x=1791796023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWvBdfWTlWbNxYn1ui3rGPRWaxO6riK7kgAYX6piQTM=;
        b=Br6lWdaxtnKiR5N1rjhd3hBUuz5PeAwAILb0hu48Z5ljFvwFI8b8H6vB62OFL3/MGZ
         13lmcIa859PuzWsEqCopGbtqyZLRhm8TN0pXROwNPiQy5k0uz/i/Tx7xYrKMpckLcmec
         b/4D8bVP+YsM9fiv4reD6UU7Bo72O2fRVPOcXcf55SWNTGbBcp9xzZCvXi9ZewWbmn8A
         O4uiU7dJnXq1bFQAMzBwaNJyEqqF2xS8ShQs/i4NkBfFs5sQSLQQEeM99QZnJJQuLkxp
         Sjar9E8S6kr0KOaqN50ELCQdssXus66PdJlHc2UpjTHow+3eQz3xh2LOzMvnUlvlO7Rm
         VUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191223; x=1791796023;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWvBdfWTlWbNxYn1ui3rGPRWaxO6riK7kgAYX6piQTM=;
        b=DcRBRVqHcAII0mXN04GbtZ0hc2OFH+LltgQZ2OWBpzxGlqRmfalomPUrREDW7l+eCw
         2UFBmo5ayhLM8iAigBFoToHDZOoFz13w7JMnu+xckYjTPmwdU/8ELdjIKo98uNEc5LT+
         DZ/z8thZYZMef+IFSWRIHZOT95/1J/HKhUZIwJrnZCare8YmOUGgxYRZU4YgNA99uVna
         n9Pj8UoIkvPELE4XpNyxGn/UwLmrvvkj4oUpFiB/Vc2qxOFAa5TlaDWwiEmpJ6ansYS/
         BnsONKvcWM0NLZr/Z1QYTVIr+qY+JHFa4HsRlGAX800lBcy0j/LQ5GEHh+BhsqYaoqBi
         SESQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFcNtYKRXT34zUDe4eWXKO89MtnSeZ2H9a3HxuxoCYn306c+KX3Zim5psjVvHcKI39yz5dYuGX7oM=@vger.kernel.org
X-Gm-Message-State: AFuF++kRR8NzQdT7PJiKiDV71fSRXW+kXcZxESvNAgUfdWta++ctJk4s
	q76gNgX70BDbJtKZUGkRzS/eE3gXoucON7Qvm2/6zbl3CDD/9f7AP2xxkjHruio348s67eCNq/r
	bJXVqJtaxPw==
X-Gm-Gg: AYBFou0gZD8DS8GDMu7ccQCvJJ6O7AZZKBYS68j8Y6lLHd05xi88SyhNIg7YTOW8Kkj
	y98ozHM6brXqZmiUTtZ1r7swATUFNh8k7ZNvxslKtvbWX4H7ODS59CAFlkZlw8UBmSshV3iBsBq
	pBufjfb5IhLtwQpOo2bZvAQ/AB+ijCltYj2grozsFlXCR9QcgchR3d2ejuMZAHyQY41GgG1O1Xd
	dTnI9TEgBA6+gz1khGOwuWlakGZ95YYZXxO/o4kW9eUD4yiQiqKX2RkfFcel1uXQ78LAbKCniEx
	VSFXVmFSl3/J9sfD6b4M0Nff52q0VX5EDheHLqCO48O+kWv+ChHd1iM+apXuUQl6s88vzYL7xbJ
	0bDxBvdCGNClEniFXiUhd//h7BLP4VJBj0FYKgW4wKb9OFnBXViLS8ZT36Z7XEVduk3orVThKYK
	ae8qQHXMH1c2lrkVqS2jShAbApuYYkqFPZqrwxwGx38gaEL6r0uIVTD5y7GEZsoXwl8tr3kYgwQ
	xuntN3ECrEUu/0nry4+ecYYsw==
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr100424735e9.10.1791191222643;
        Mon, 05 Oct 2026 02:07:02 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm189528695e9.1.2026.10.05.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:07:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <875wzhjhe6.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
 <20261004205903.E62F91F000FF@smtp.kernel.org> <875wzhjhe6.fsf@bootlin.com>
Date: Mon, 05 Oct 2026 11:06:50 +0200
Message-ID: <1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 04 Oct 2026 at 23:16, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:

>> This commit modifies the clock driver to retrieve the external HXT and L=
XT
>> clocks from the device tree instead of registering them directly. It fal=
ls
>> back to registering LXT for backward compatibility with older device tre=
es.
>>
>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk=
-ma35d1.c
>>> index ceebcbd8c18b3..ed61a990870e4 100644
>>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>> [ ... ]
>>> @@ -240,12 +257,18 @@ static int ma35d1_clocks_probe(struct platform_de=
vice *pdev)
>>>  		return -EINVAL;
>>>  	}
>>>=20=20
>>> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>>
>> [Severity: Critical]
>> Does this unconditional removal break ABI compatibility with older device
>> trees?
>>
>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
>> removing its explicit registration leaves hws[HXT] as NULL in the provid=
er's
>> clock array. If an existing downstream or older device tree consumer exp=
licitly
>> references this clock via clocks =3D <&clk HXT>, won't the provider's
>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
>
> Jerome, your wisdom matters here :-) For me this is a false positive,
> because nobody outside this driver should access hws[HXT] and the clock
> is still referenced through the DT, just not provided by this
> driver. For me this is not an issue we should consider, let me know
> otherwise.

Strictly speaking there is (used to be) a clock at this index so it is
not a false positive. Someone crazy enough could have gone through here
to get the OSC even if does not make a lot of sense.

This clock should never have existed to start with but it got in the
bindings ... and that is the pain of dealing with bad bindings :/

You've got 2 options:
* Removing the ID from the bindings explaining clearly that it conflicts
  with the fact this clock is actually an input according to the same
  bindings. I suspect the DT maintainers won't like this much ...

* Keep the bad support binding in the driver: You'll need a pass-through
  clock element where the parent data is the fw_name and a fallback to
  an `hxt-fake-internal' fixed clock. Feel free to add a comment
  explaining how bad it is to use that clock and what user should be
  doing instead.

You'll probably need to play that last trick with the lxt anyway ?

>
> Miqu=C3=A8l

--=20
Jerome
