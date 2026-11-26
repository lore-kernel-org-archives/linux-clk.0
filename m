Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689244;
	b=uqvXzqow3VMwLas521cS4LYb4JTE6LNeHp0Uru7Y2fPscj5zSKM+YZdLvi+1WlWHhXe+
	 Zy70+SkLtyUl7uCrwnFiv1fVR/azVMt9fvCyF9hPRuMinvmB27gwy6/VWk6vHpYagdlWm
	 sfn3EMaUl2e+0VDoVe7lPTGE5HGR6nldhX5laEEhutertu1c06ocpLj4uE+DBQ+zGv8vl
	 TeKk+JvfEo0D/FAbkJb+z2zg3b7FxiUfIqvmrUeyKKwKGgY+QIh0T6uSV/D1ETlKObCpP
	 WvDGg+L2xyzsoWc6fBXGSdzrjY0veyyQ/hwLzsD185Ie0Tc4mbe4hplr4WffGgO5mVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
	b=yys5DH7lDfH3/3Yo3XsJUxisz0wskYmkVlYQuTUb5nI8CIDgeB8fgPTGiITFQWnXqRyR
	 fngUoraSpjhroaZqEvmTLAEJcdYS/WIsqim8ptj7kuruxEME4i3M1UHorYTP7HUgPXKHW
	 FU2mGnTKweaLZEW0zdis9p+4C1syJIx88muAgUU3+tQFwUzceGVUzDIjXtpEiqLN1fpHJ
	 WTOKQfZGU+KGOeOV1B6W6ihgAT+QOmGHDwZzsnke6VJzTuj6ioU9R58zN+8acszqwraAc
	 bE3yXgK7WSJfeQOQkS5Mz3NsXtbyNAUx7wbS/XP09uJsbbawgJJRcR+ZKg+slfErj4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87251606A321
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87251606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so2534272eec.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689244; x=1796294044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=F5Dm8yJqZJ/eIFY4KXNhFuQ/PKsgI8ojbyn4Qk/Mv4AzNggmrVvBIXclzBnaw0Ihf3
         TAqc4T9s57gJ7Lq9gix1mZwarusULJYDrwY9qHV0IQhC6ZxMrrPZ0rCKn5ENv7LAIbUk
         Qd94p7yYd/mLJOckfK+3i/vF/51N/1jaVo5XPtSFXmoW/AfxALbT6BzDP7CbsZk+Mdii
         s9Alx9xyBDo8JoWEUTRl+c7vn48WMLXwuOWQH2lrvec3sDhIsL4poAdHPhkEfNY1Fm/G
         Oo3G4H7+tu2Xl5TJzpdBCNcKTBDXxFhHYwOTYsJO9HM0r+7+vNkQngffTDm8PHyhojAe
         EPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689244; x=1796294044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=jWTwUU8colrB1t9dF0KefNtdooa4faIlH6PI4mGkqKoi0m62A/LNbwlniygxnevNRe
         pCdsbaceFbqnL6eSuigGP2M9ntt+Sbd39sITvZb87c2tk6sGiQBHpIMT3i8SeOBeYuXr
         iVHcWzM6yLkZyjWduL9fW4ZfMA3EGxkU8jzqG0jP0UMO+1zOVGF/fNHU6ctrIXv4/HaM
         YUwZ9jKbHEFKOLE8lArlQ/Gx6MB4iUNui5zRRBo5q9MhMC2KxhgnySRNtAmDuc0tPa5U
         9xG4HEi94fzqyxGyZynP/0D84NZ8/STof0MCnPXNSrZHw1HpgLxwF8dOS4yXwEdnUDv5
         GOLQ==
X-Forwarded-Encrypted: i=1; AL+hErGFUVAfj5R/r7c5E1Clw3m8P9Lx2ajaGq91D63YebR9kczr5yMce+7PYxSLpDvC2f4K8LfCZni6W2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z87FjvYsyLge5w3zIQ1zZCenywCKPBS9egF2EfNcWBVWfriRBnJ
	2GKWoZOWbulc61Fh/y9mixeZgdGWDEs5T+2Em3aPD1F2yVgOcQY2Dt/5NcU21RRNZM8=
X-Gm-Gg: AZFdTZcVNm57El++zrboeQW9I7Y5YbiLpd0Fb6jqKroaoPINbLCthdyKUJgEQFRYS3w
	zkcN4dCc8xn6+w3kHbrN7Jp2AZfTZPVQPFLtKudtHRBU/iG91ATF+yfrqVlz6Ii4AU68ir03pW2
	UjR5hDUt/h2tHi0d0es932/d4s16zp24DjonxIPFMAz1jy50cTruQzRgJiGrWixxB7J4ZpNdBSv
	88FNeOtNN3ZCrWdOtjfn1I11LkscIaZOOyFhuwlPiUPtV4ZMYnacq7WYqpQ80UEYCffY8LYt8Ch
	JrKk44qX9zV1prUFJf3IBQ6wvzNmtbBNxUpXHJi9IHuWQyxei8y5kj+vrS8JsJFaQ+rFHvhP8wJ
	Rv1bkZ5+vFqGgpmMtvVgP3+h65QrfVgvxOg4BSRXKrhfT8Ub8W301KIFuIajHuxL0h+k3lRQ82V
	kuWfV5v6/cvVldzZxWFf0QMWR7eKlZAg/sPcFN5UcNclq/mgfRQnNaVovw2UQbbS5xIOYp3+Bmm
	3JUzQ/rvVeHp4kaLdC20UTqhLlFSTxJZ+sPBgffRIwbbrnaoMF/zEP5Vb80unvCa8Jq42OnUqly
	my8GZFh6eAeH7PVmb6uOPfNU03cNmA==
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr4653486eec.13.1795689243454;
        Thu, 26 Nov 2026 02:34:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm76487652eec.11.2026.11.26.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:34:02 -0800 (PST)
Date: Thu, 26 Nov 2026 16:04:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awgLGFpH73_fcnbC@vireshk-B250M-D3H>
References: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
 <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>

On 26-11-26, 17:49, Chuan Liu wrote:
> Yes, as shown in this patch [1], I forced the above two
> "assert_single_clk()" to "assert_clk_index()" and it worked.

Maybe this is the right thing to do:

Functions using assert_single_clk(fixed-index-0), can be converted to
assert_clk_index(fixed-index-0). Lets make this change in the OPP core (in a
separate patch).

-- 
viresh
