Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B121F582F
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077648; cv=none; b=VSi9MuydBmtD2+RzZVDM3J2DgCs3vwdC4wn5Vp2FlxIXKaMXgv6ngP1A5yw7PPi3GBjZL8I2G+Kcmc8+/Jou/C/LtLLukXxuCPToa3o+YebFZf/QL0iGnfgWZf169gk90wzA14ndM6T+E40E//EwMf+8Zo7N5iO5ohAcRAqXmQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077648; c=relaxed/simple;
	bh=n2dqkv6VmIcMBfY2ja3ECua8O5M36w0yuJN1pE6B8rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okaBEgjWHkQmGXb2jHORWfGRnmM9cPreSAQmimCU3XC4/BB5YkVI6lQnfM0IE3MeUDA1vVHstjsZYNd2Rhr1tx/Cyq+gW20HZ37EVUJfvnI/8E/B+2pqFCv1ypzPQwMow5NHyaKTY+hUgRSomjrtdWpawnF1cUrfWJnr8k1b3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OR56CiQR; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OR56CiQR"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so3975654276.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 00:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077645; x=1741682445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjHa/M7Ja6GZpMzIKOU9aL6acZmi6aLPsZx9gsCJNXU=;
        b=OR56CiQRfELTC1vAZpAYq3Y5pA6jRmJnyCd/fzLFInPm/j5jnRTbHjjPB3bdDvpedc
         /xOfZt14TRWEHNMqmnPOgrNnYXSaqi7gzoBzixBhUDMpEujCUa65O+Gh7t20mb+XoXUO
         dSjMv9XPCiesyIS6NEA8zcgUSZ7W8eD2kSAmrcRaWPEb2tihUCGhRMqXeyWI/NO8Mfpc
         2W0ltiT7VzIgrQigXg6274PaOKuzwA2jtNN7KBvJkBEAZTrY6DHBwwMFnAPYaNAL0lup
         YadaXmTHVwuPCIZKXYb+Gop4Q2oJYwe59MKhoJfqovzym8Q7+O2Z44RnQwiPj33CyUTn
         ofyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077645; x=1741682445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjHa/M7Ja6GZpMzIKOU9aL6acZmi6aLPsZx9gsCJNXU=;
        b=HNgxKnzAkIqRzmKDRfLrcsOAA83AHAj/CIzF4aHTJuzUBGPyqdkVUlwEjkHyL01sv1
         KtzA4YD0DEbSKtV0FFyRkFopVPZe0R8IKKcDwDHjwgTuGejr19ZIcPvnGk0FH8kSTyZh
         2zNfJb1XuXQ/jdqZxSa+vDM4kpcwXvy5jkzBxG2o6SQ0R1bU54sPgMgC6umZktbMmk9x
         X8CXp4DeLTJNXimDrWuXwGawNio5iKhegGBz4CUfdCNf7X2QH25EawfDLjzR4buoROQG
         3x9dtqagGCCwyPB9CX5BtA6aCxJonXBftHvV+4ItnNxKNuTGATlkgGnKWxikCkRegYIC
         BgEA==
X-Forwarded-Encrypted: i=1; AJvYcCUfeSxni/pKqDwYtypJl8NhsWUUy1wQamKmszPaBCP2PgauV++IdSN1j6nlgRKcHPtQFZsTuBXP7MI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlhwcy0Aiu+Vo0Fi8d1LHFDj6AHq4y2DuHrsXleC56U+4hLlKv
	CYIua91t6Ljqbz9NZNTB61x8jhR7PEonoN0c4fLMSlA7P2WQvjw/ppvr5azycVjp7x8GLXf2aku
	glpi2ywcg1CPKv9lIRnRuEUgGASPUoxeJfPLKxA==
X-Gm-Gg: ASbGncv9Ap81K3vo+JhQsV/rma4x6DhE7t7cZZ4kGMGJgF0Q8SB2uc/mlDMd4+Azo6a
	fDT16bqXxOdkP0p1IaOT/0oP6Y1kYudnhG8czIifFvoa59gUtd3Z9hwHDpDyq1Ukz1JiRhJbZdk
	l1Fqk+Bmlp6QZWEoR4bscN+Fy2
X-Google-Smtp-Source: AGHT+IFXmE68ihSGPFYCeO8AjPuKwgMSkb/JwBeaSq10AY+V7CaG9Lq8teRSlJDX4sbY9VZhLECVXcDgKxqfBf0O+uI=
X-Received: by 2002:a05:6902:988:b0:e57:4226:8ae0 with SMTP id
 3f1490d57ef6-e60b2e9b57cmr18557753276.18.1741077645466; Tue, 04 Mar 2025
 00:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org> <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
In-Reply-To: <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 09:40:34 +0100
X-Gm-Features: AQ5f1Jq_CG3rPPvbs12wI2I97a8wGeUJnFI5bNoL6Im5zfyjM1I9k5UBEMej_KU
Message-ID: <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 3/4/25 01:53, Dmitry Baryshkov wrote:
> > On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
> >> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
> >> domains.
> >
> > Are those really required to access the registers of the cammcc? Or is
> > one of those (MXC?) required to setup PLLs? Also, is this applicable
> > only to sm8550 or to other similar clock controllers?
>
> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
> not on any SM8450 or SM8650 powered board for instance, however it does
> not exclude an option that the problem has to be fixed for other clock
> controllers, but it's Qualcomm to confirm any other touched platforms,

Please work with Taniya to identify used power domains.

> for instance x1e80100-camcc has it resolved right at the beginning.
>
> To my understanding here 'required-opps' shall also be generalized, so
> the done copy from x1e80100-camcc was improper, and the latter dt-binding
> should be fixed.

Yes



-- 
With best wishes
Dmitry
