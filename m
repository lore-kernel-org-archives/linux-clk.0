Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E6396B8C
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337831; cv=none; b=JH7bVc2uKX1sicRHe28FQkyg1G1IKWRpBhlsCErJ5eoAiZYrIe8YnAqeYb+M/k6qhYlxXT2PYRNb+al33I/yCchliatQSKgnLkamzVbNUy3dC0kDF2VjjJNspPobE456UzrG3szkUMaH7+AbUPJi/dhEO3bAjBlEYsWxcNnEAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337831; c=relaxed/simple;
	bh=dO/mpADzMV7Bgz+dNLvnHa5uezPUyzJiV1A8vcfRjcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQqjBkybe3fB5EgSdPnoRq/QeMbJRJM5mwrScL6uJzU86UwPvZGoNSo9+AGIUMl4dOFOA96qjkEB598CeO73fQFLA8cEoTG69A55P0TMewEJOOmmqdBp4SoQNXZjImewOHWFCrFx9kuQXFBzDnp46sIkphgSw579mmgCuQHA22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc+NYHr8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc+NYHr8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo478453a12.1
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337828; x=1778942628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTagnauLE+hhKKiT1zAZaD+hPibc/QQjA6EWs3KI5oU=;
        b=Cc+NYHr8FMBLyFMItErNkK+Jr7HYawtfq+4HjEjytz9cyTd6sMGoZeUA8uJcDgdXka
         8rR2ERGQ+ne3e9jFvzGg+Hz0Dnk/VIlbKewFnGRQdgd+vYfq7DWhbpo42T0kZoXOgto3
         iGOWyIq1G1TbndkFjIeJJk11jlp5CS+oxW0mCJcVVzEXOtV/B479qDvpTXsTLCR03DkP
         XXxPKcwpWzQEDqVV1SNR+GLSZEDl8lRyUGRo4paFZis32Z/mPJzTByEgt1RGkYU6+tVG
         eIzVZjBY8UQk1VnfV9DGkKMw35DKTfJ6HC+Mbqil/6a8+QIPmVmcWk06b5ZVhFACl2Az
         089A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337828; x=1778942628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTagnauLE+hhKKiT1zAZaD+hPibc/QQjA6EWs3KI5oU=;
        b=Q+BoXrfJxmaMmxHXaTuWA4I34Kq9yojTFJ1Z+24wfuhAPcTkl6x3/wtNzE2mTs1zyp
         nRoxUNmws7tJfjiW9MnxSApQkgRqPgl8JzLUnWOt+odpNWu30neZfUta3btnUH/3y34d
         Em/7AubMRyBeAt2l0uSHjVxahNIhGboceym4bnCxs/h+Bx3fkjUWNEp535VclMY8SZpx
         Gwm7n2y+0lJkQ95OgsCw09JJzWs3rCkpLBYlAQPNnVgpYRJINKeFYawlAoEtjcI3qzyx
         q2ANTU3kCTxAw7aYwHSbEN7+bG/ubluls468eWUQMMIqvWh3ghSz0FhMjtmYtU1ZfaQ+
         XaAg==
X-Forwarded-Encrypted: i=1; AFNElJ/ESoRB6rgo4hQ/8nK2gGYAQG7GDJsndo85aalciS2n+dbbKxbk5xlT5KW/3iO8H2UnwLCLmjuEiAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKE7DvG7QCD0+DeGrK6oJ8DzfpaI7aoJFMNbdS+K6hw3jKdYA
	9vvCHZ+iHs4v3TJC+THhB6a8jn9+uU1pdTncIeUEara/jQJfm1O4vw5x
X-Gm-Gg: Acq92OFKlQYxKdzHbOoDl34nbcMw/2cl0Ti5smYNUHM3FF3TFz6k0MiSsXG96dyHfPe
	w9CTwAHfc3xcFiQ1peeDD62JyfSTyotdePYGKuPbzGrMB6HtK+y2ijZ9C1WvodQFAvm5VnOfCpk
	Rdglsix307iU9NvZ0bznJ86NKSzZq1fWy3lY0QZn3EbPY8Mo1ExEMsS7qcSr/b2uaW5RuiOqCOi
	W0ROoDLqqjKEds36owv27F6dMeGmLK8tYiDehkPIjWvUu0A6sRvifD0FcXvk0WlkCpXT6go0v2E
	dkmGAilGF62GQ4YoPE2Pi0eTI6PCqxiPi4J71Nb9UN15UdpMU4p0nAIGyJxQCCd/sv1YaVfsEF4
	jz4sLYkoB5SHHpstTqBb1y+3Xz+fr14N+cDlOs+ZTd9ZnhMN3K0ByVAtXhGeUgEHRcRPC7iujy7
	ETxNbkhpmvKWcB/TBIUoelqd7LBFupIClWUUvY+SV4ACx0Baq44mutnzP66jo+jsM5iUeG
X-Received: by 2002:a05:6402:5407:b0:673:9b15:39d3 with SMTP id 4fb4d7f45d1cf-67d642b04ddmr8185100a12.16.1778337827665;
        Sat, 09 May 2026 07:43:47 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a11asm1820101a12.8.2026.05.09.07.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 07:43:47 -0700 (PDT)
Message-ID: <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
Date: Sat, 9 May 2026 17:43:42 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
 <tawGGT4rtpw22Ng-MgM--GhoEihBU7tY_TrFUHf8raMKApyqTcSkKHyfSuRIL_bqNp_5zWD4SBG_C4c8CB7_6Q==@protonmail.internalid>
 <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
 <614a087d-d219-49cb-85ee-772044558649@kernel.org>
 <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
 <-hM6afm_Cu_8Cha9U-hrlrg6CGDEb5D3PFpPPCfIh-QgkdFJp_r0Ah9k1dvAF4zkju2dPc3FZJxvOA4V4hupAA==@protonmail.internalid>
 <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
 <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> OTOH if Core1 can't be coaxed into working in either mode, we are better
> off either holding off on this series until the breakages is root caused
> or leaving out Core1 entirely for now.
> 
> i.e. there is no utility in declaring an encoder or decoder to userspace
> that is known to be broken.
> Last time I tried to enable only 1 of the cores, the following would happen:
- If core0 is enabled, HEVC decoding would work, but not the other codecs.
- If core1 is enabled, the rest of codecs would work, but not HEVC.
Given we don't really have a way to power up a core based on which codec
we are dealing with, I suggest we leave both cores in the binding and
enable them indiscriminately.
