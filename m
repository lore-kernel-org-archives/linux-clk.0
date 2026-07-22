Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC347DD40
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709448; cv=none; b=CKDo9B5Bv5gnv/xYiN7D3362Gxdfj68t1RN+xWMp2HxodnaWBqiK/uDHbvXBHAln39hnhfALvwaPPTS7OQmc+IpkQAJVIPBnkzps9cO/Q2QdIbVKUVE4Wu/2ShizjPubfDtauXrBwYzVwGaq0aebpAfYKfHFh1r76cJnzVDGlQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709448; c=relaxed/simple;
	bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mUdXLgVDs+4tSMcwPfO3ZKkgyB18Kno/OrFewdF6odcrhLQYxd8/6zvwlal6Xg4xo6jxLfPQ0JVG5NIT8L9AGJ1/E/VQstbIidWFfdv37TkNMERqwBKOt6KgOOe/X9+eEbgf5YefthOawYwdwuVSJJq81yQhVlzlwVCThu3QdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pbw628D3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pbw628D3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955de8797cso18968505e9.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784709444; x=1785314244; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=Pbw628D3LlwMuBl7Fro2NfESKu4hM7l/dcrQb5v3odRrQlEHbAqGELZORib0AAoUxh
         DSxPizGtrny/LreGvmxVKMWATOvsyTh6QwmQ2jtt+W99apXQ4iHGoddZXcJpNWvI8Atl
         3qApKiXmpICM8jJsexbJ52M0jp5K9l6RYb5z1OEdC+RONbFD7mYFruj65phXv1tOmJ8+
         PT42p/0kwW0ttC5oAqjs7ZIjbkTeNEaHjdOTJkya8pfFP0nGpjsQ/UOtUfpN6Om+t5tp
         cRGS+INKxT+/JQQh5avc2ZiDPDCq1PWpjp/lBJnQIzCkHWomLOb9QBV1KA10AMxo6ps3
         QTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709444; x=1785314244;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOhJGwQ/jTppwk40BJWO/omCtNBGTT070lPHgUjC928=;
        b=LVvN0FS3wdpv5ZrbBHlKXBr1JVnxvUzrYqAI4qC9ob7xp9b7VHWqdgJZq7k3BEA+6s
         oJG+vE4sr80YyaMstXZaaYe7U1XtBU7yW1zKh2wxY0k4UlcGw7TwJ6QnxYJl7ESk4fsk
         NHtKhz5rLoKtXwPTJpn2xRMLNGpg+nrv0RpzXgkkmyZiywLrNoXw/LLLMDu9VOkOcNCM
         G+RGE6pujD/8HH30D7vwdy12FfKgJAHc46vj9G/flKRe8cUfNuyChahgHrX5UNCpfjV+
         QbL+MrWz64HwySdnJNQEMTr55RyKhA194ZnInfp0gf1yC7fM0WsBtRIW8qatOGa+iF8J
         S4tg==
X-Forwarded-Encrypted: i=1; AHgh+RrZCkZvE9swlSfarVPE18fVcKWmUZIhXHYQ8SgSzlLziMpfoU/EBNCVCgH7e0NEd11CnzlXVr2D3Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYjshXp8Qj3W+sZk+Vq6UBK2fydWc6h5vuzjMFJ7aOxTj4pWYH
	y7i9CTPNV5Fnef3Eu+iO/tqVeVpkV+jf7ek69oWjwTTZdL+GbRqAzbWee4fTROQ+Hb4=
X-Gm-Gg: AR+sD10XMuLnsu4SsN6BQ6frP4y/33Joqi5oNWF0Xz3Sxe1ztzxCw93WBKdfkIxprNs
	Xkdloa24KLt4TWEuSPZL7dIAIG3yQSOxh1eth+dGFASLzaQE31bvo2YoRfKCWCBJz2q+LTmeKX4
	1b2ADbtKNXJ1zEIKkn0mIltqk16Bsjg1XknbQHnGsj7z3lqUCgvg3Z7sztPRNEIoWtVKfYdjREs
	ppa7KSVxp2iy0lQb7c3s5H5cmM1szR/inip9qqKCgjWMaD2fnbUlVRQbXBq1MO+v92p3a6Ab8o9
	bj5mOY+BszxqZ6CtGAV3O0VhjOPVju5MfNmT9E6tsbvtkJmOQ6e6K17E2TRcAf4GUspkaGu3bCW
	BMSzplngJsd9eY+QCCB3hdX0tXzpCNRUCwyCL2XqtOnvaMUtJWLPwg+mRvRXAJT2lUZh4o9Kef4
	5c4aUKDjBBNPGzsejIi7hU
X-Received: by 2002:a05:600c:1f94:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4954a3dc491mr258598315e9.10.1784709443731;
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Received: from [192.168.5.218] ([88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fa41sm57819035e9.14.2026.07.22.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:37:12 +0200
Message-Id: <178470943209.3016846.4248808809182663974.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=557; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=R1aowIMLUKz8Mx0Il2jJ3Lj0sfhpmxClc66d27gkbKA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYIE+5J9Gg8PbLvC5hMVwlZfdB242pjzBhXe4h
 S5SMDXwJRuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamCBPgAKCRArRkmdfjHU
 RRFTEAC/ouSPXHdha4O6c1bMccpH6wqcdaKXdI0tUhSO+53+iP8xLJE9f2LygyxUDuK42ps/Pwj
 ndEv5DMMf+pVNfsjHlXjTEVmbbQOBHwIXrFMHJB3aYZUfbFkros0KkUkgvMQcksQG1p2P518g42
 NBZ1Hy/fA0UKPlMhLvMVl0YkKoI6Wu2n55tOn38NFfBEoh5pwzPyNrgkIZaghiNqGyFaIzooJhd
 CEb4ichOlrmboq2SrCkYOVLYg7SeM7pW1c8sbUt6M5nx2N6HZkE2SBve78kK4lnWAAL/+5MjiMm
 wUPvgiDmr5yCrnOJuEUqQoZ4lzF+G2gR5aSopqgUNTKLvAAkPf2DfEuRHUS2z62hdLo7YoYFRyc
 4gV2Z9M11K2SiKnEfR6U72Pt4j7Rc6/+uOf+JJmGaRKkKuE780Erh+iP0IYhxSDuXsEyI/yAj9c
 kLA/FC9ihoZUQWplfTfyQcZcuSuH7f4rkJGhFGj0vXHTKvT3HVDuqKtlXa2TnYPlizGPIeQCXzN
 YCAhLjPrVMTYzuYGdNCDP+gCXdTC8LrHg+AgiA1z8wWiSpC5v4vl7R2SbRqhA2skfMGOU/41JdO
 WpmXMpKEeftRt1nz9vwVA7H7i467ejwQ0kQbb2wSHWQr/HBt3gxPmrDFzLCqD+O3Jleep+lIual
 JeSfTRBuX4Tr9yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:17 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
