Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531547;
	b=oTu4ojtsSmTvpDUKpJAIv0NxbQI35cvycr+hIWUQ+gVPVPXrAgtv7mOmhSoCYuYext82
	 tZM9D2w40Uj4t139dq/O0Ax0mIrzcpb/1bpJLvrJlDwzwdYqLyDuGC0HVqRazaBPsfhkK
	 GsPFuSVCLuaaTYyUdQbYXQCvyS03otA53M8aUOlOJlhEuJazxRB23Z8pMYMUtG73HCYPV
	 Sf3NylwuTQkIHgCU8CJiY6J777iNvMB1SI6dT6F1lcddEi+MVmPWfLntleqGxPNFvS1Pc
	 A5aaS5ujppQh6/LyeXDjz7OsJTBYtRgePLQsN8sGM9PQThUzEpmTQt2gaBxUPkFj9tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=GwmFbwJbKOzsy+c7dyYCjwTzzq4yrwUhMSucCQ5E8hO4tbhXBRNpT5ruRLQOJ3TDgTPa
	 j6CK8HGQxIptqszChCuuKaoVVzNC/CkGsUSOkdyL+PxQplFkOSHfa6wwSpT4EBrRa7tnk
	 vqgE6BrceGj6S2CuPxmxmmmIolOUIXEDON+aDNF5qWTByB0+NfjT3V5iTrrlJBZvgip49
	 m5yyXCDZIpwXT9ZinMQE1Ky7bGxFcBCwK0wz6lY1fziESKiCruAGMgwoUZzMr/yOf32M5
	 CBVKroskKHe6y7nJhfWd5WDJz/P2AiPvvNljgBCL4t4doXzPU8qjj0Bawcis7+mWDXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B618606A321
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B618606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so52955c88.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=raKejc/BtEByMv9n1rv/P12zy/k7MMQfDvSMx7aXPnHcy+WBXDK17x3vcwBMEK7eEJ
         v1srzII7MraBfxQU2kHHrIQf8C0oRRJ1ve0I+wBk9syRCSXSXgabP3nJkrBrnd7jTsYK
         KWQoTl89oKV1MBl2S/RhTLKAoXFxK6kbUhaN2xS8pHe+nQCc7REWPx+Fl4LSz9HjUQgw
         AWcJhu0J5fYLPQCqhMadHlfMFk3YANChSUcR5XjgkgtXrZod8QN6LjBVhrSrGIQyDEER
         tKyVIoNyA3o2g57DYUEYo0p6p5qd4mEMuIYtjgF/8aupFWOIaoNFF2qTZGJ5U1ynAx9/
         sBXg==
X-Forwarded-Encrypted: i=1; AL+hErFonvK4lwIy7w5jMHDakblKNfHpSVA9+X99e2ZUj4+cz8WkqZ03iUPtKE4c8w8/kZKCbqWRib34qDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bRJU6EaXjS2e8MDoOc1Y8Mz8KfjglF8+XazE2BBhVkzkTo5mQ
	KBXxdfqOhkI51I8TZomOaAq6zj2WSu+u61q4lSZM0n8zWdX1EcGUb6/T
X-Gm-Gg: AYBFou1QXYS3rwECVyif2YJe4IfCFgBo9h0eWUGi5C+NzR5KUqOavUN4bJCmRXg+oa0
	hMgt2ixp/rIJerPm5NMs5GaECaps/Qaovy57aBv1XjFq8E8fDHr7a65vUFOu9QHST/pnnZAJlGj
	pZFkguE3F5x7h1jc2k4FhG/pDhEEJhN0qNvd+n4TVwurfeNgSUuyxENfPzWpLxVatLOt3yj+FGi
	gsoFNVFN1TyhuIxPrwqvnYutL/8mlksYk+Vd6/YqYXXB5zjgMp08hvO7pPdy3z3rjXE7B0qiMRl
	dP4zwWTrmB1mfaW0k/AeLy0Gm2qq0nlXnddiJqLuVGwJbSbFImPK7uHB914tXvEd1CwzEMJAYKp
	yd7sHjHOxuCd5KbML96xdX03NLgHnRzPZvAKcMLcAB/c4NGNNEAwKCxDWLq/RbZpcF3bkY76yuz
	D6E+eWLPXmIc6Kuw18ZZVC60CmkoiIP9mmJAAkhg4ZCUnF50hAjdBsSNNaRnabjN1KA2iFBIRUX
	K8GhEAFm15/3I0xqq88A5jlLZSwJ4YFf+92eCUz1ArXJsY+bd/etDk1RUujAUR7Jpa+edtYxTzN
	826mqVD1dQezAVmy9loNRsck7apvqNY3An6u3B6cWAedYa6Zh3KiZgAQJXsIRj/eK6cKRV8=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
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
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry
