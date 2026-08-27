Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CF3C81BE
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819005; cv=none; b=jlnwynNzV/awua63I7IL/BvosHJLacZ/e8W7M83t6lJS11I+LrpRTK2uqDJP7fiKs6/NGZNpSEUIAWkV15BdmP2MGKm532BGd70no1TsmllKEcTjO2g1upDRGZW0xi4r1nfnWO8PCIuuZ6F+2IAZXSlNDkKIzc1j2Qqiyz/h7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819005; c=relaxed/simple;
	bh=WPX0/BZ5LnEVrTPcPtmV68GfdYM6tPz4FQHz8zmVGXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnGlEjmfHHt9mOdMJVc20mxP3mnncpUMtLJIzgnHwIMR/spMHJuYOFZRkFkJxavPLCgeewU5s6f9nCwJi5jqP/cIkrxt6qmujWGmNFTNJ4oKKP3a6gYAkgDgSRNQ0q7Mc0n1v6zceo0yNx42cOzaLdlQNns1+e0lfmHKQ1D35w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQrguZ3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQrguZ3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso15213095e9.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819003; x=1788423803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=gDQrguZ3GbygbvSTSsbzOtdcDAZ/KmZ5QpeK0A0GJd92eCwnyEpTX/n7DykR5/EMRG
         Do8E3XWkes0pQRMXViSHKRmqpVePXr3bC4zHHlg5Ca0sBusFMyTZMeEunbnUzUsKbZAT
         UEEMBBYryLKIQTkkkoqCfB/e7uEnWUH3SZGLbxkaJZvT7lsgmfoYdADIPILIzvrsrE+h
         F+/ZI7HTMWnDuTV/h1Taf/z3/PHm/BRYR4TZN940zEqJYqiQJe9f3VBepfxoFyvSAA/g
         TAQuMhaaZOIdFOlatEXzjKk/aDp78x3HxhpqQ5a5nRDx+w1Y4k21OcJsYqRvCjMJw/ee
         Q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819003; x=1788423803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCTHlFI9MBXTpjo0eWsv2vQlQ5fLMpFKRDETi0QkNLM=;
        b=OGB32XABJJ6QJwWjvM5h8ICkssgLJbJZyz4Q+L9q50AH+XY6j06JJmh/hFOFyrEkrQ
         qpPCKwNQXZvyU4+MthpHOHlGTFi/KcErrGjx9tX+HJkaZDQZVFdOFPFFm9IB/qBUxx4a
         iTNtXQ5k4ZFL9bg1U07H+ins3icIqek24TEuD6uhW1ypEw9gzHjwy2qusweVSD27HL/t
         k+NIc/RWcGX/o8fKGbT7ifyfk0VTK3lPspWDAe4xXhKe3F1gQuWsemKQSuVTtsrr2978
         ZzujW4XeyM10yH3k8cRTG3D4PN/xuiQKUIMMEZNQZeiuSNJqkh4UB8Y9oPDzYcajCFR5
         lvmw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4bS4/wDdYPax/qWwYq28jEf5SI0SZ62IhPyKZOqMdSEc1nxu8TrkxQggbAEAVY310R0XW0CxCb+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lqS1pfLekolk835KoMCptyh+8niJ8L2hoQmJPPORlpn3wbkv31
	yYICBgyBpvPQ6smKjh0lNElW7mcIm3plR7J0zDcv0sw980N9JCZ1c6nz
X-Gm-Gg: AR+sD10UGxyAbSOGHvfslDEW/hPIqE36E6VwhlxEBpQ7iD78BkD8CMxL0eZXpl1OmgP
	ccp4nKDGn4jazpkl0yEa5Mxd5Xsmf78ynBtnloJ3tXSwgaNd96sZdeC/Dj8p/q7PcP2Z3xrTUJM
	JgDoJqox652aB7qDt8uSRJVPNVzeqvHWK0FSkRkw6oCMaun1ATTOO9ErdBDiToLri0aTOvasfCd
	Iz/43LaFEQqtfPxedSUsgm9jEHTgc4iymVTO9r9/op0S9AGansuph4l033KelNqkmqMIqwxNPyO
	SYQC+AOl+w1mClC+DtWugufj5/m7555fuSVgYQeVqe2lF26RJRVe8fUKPXePRJPOWsqueOOCJc7
	nNPUCgWR5QoKUoE4ttp2K4es7JllKVIJz7tOvUygdOiF8cQ+zXnM/Wr1iyDVKs31FNivXRNAinj
	p9SB9AMxD8Av29tYek5LKfrUFYoVvwnmdIvjmpXNXmfAKY7r1QSr1SnuCMLNjTFMAHNz7gCuGIH
	RTqHWkFHKR9FNai
X-Received: by 2002:a05:600c:3155:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499dc6feffcmr116979315e9.8.1787819002485;
        Thu, 27 Aug 2026 01:23:22 -0700 (PDT)
Received: from [10.51.121.166] ([193.118.38.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab4dasm7350450f8f.15.2026.08.27.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:21 -0700 (PDT)
Message-ID: <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
Date: Thu, 27 Aug 2026 10:23:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260810-smilingly-kung-1fddc5e18df6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.08.2026 18:58, Conor Dooley wrote:
> On Mon, Aug 10, 2026 at 11:54:03AM -0500, Rob Herring wrote:
>> On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
>>
>> I missed that this is N input clocks and 1 output clock. But that leads
>> to other questions. You've implemented a clock mux then? I still don't
>> understand for what h/w that makes sense. Which input clock is selected?
>> The locked one?
> 
> Yeah, I thought this was n inputs and n outputs, with each gpio
> signalling that an individual PLL had locked.


It is n input clocks and 1 output clock. It is kind of a mux, but the 
CPU doesn't control the clocks or GPIO signals. The whole idea is that 
peripherals check the output clock, when it's locked that means _all_ 
the clocks are locked and GPIOs are in expected state. That's why the 
selection operation is not really implemented.

Actually the number of input clocks don't have to correspond to the 
number of the GPIOs, because the GPIO signals indicate the locked state 
of the clocks that are not accessible to the CPU.

Slava
