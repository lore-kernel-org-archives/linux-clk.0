Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7A9443
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759604; cv=none; b=OtYO5z1ZMnNhKEn/PmjJM4JPwIFdn8Jl69LTzCefugIvklyyvuWIscH1O//PgWiOVcAsXpPMLKoWpwzDqUGeUskHEvSWpWp1Gy1/N2pP7yo4dR2ma+4phbbbPAO7Z+zMII0h6ANi0F/vqCQDvn6cRfmBoue8E5xE48PSCh10WuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759604; c=relaxed/simple;
	bh=h+jIv/VR/qg/OkeoRAmJZWO/7TJ5eC4zehTmarVjkRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OJgxFnTeCLqkuvFZWQHZ9Sbj9LGMdc5KcSDJhYnBT9yJYiekp7u+M2CTOdb6xADyXaBplhktUEwxQBTikOG87UUzGTHQrGbfnQlgDGaZiS4zzqlaB3eABVDmVx3jshDIIOCM7kI35BvLgSM1gkGrwbSrbf5G0VVtTacUyV4CchM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=WvFCyP2z; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="WvFCyP2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775759596; x=1776018796;
	bh=1dCRk6aG+bHFM1iAlVcJctJP9zr01ilEISWMWsZ2g4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WvFCyP2zZNizTaaPcKKMVhrApyAviH1GJfF9SOl4YV7Ngi/yfJCgcs1tgq4a1BEPZ
	 S4h46AlX5puJo4qJg5FnykEDj+kaz3j5m9SW9QQPl9wwGC5g9ffAmMqIRP3qpcgArk
	 89w8gmcdL+GILe55PDfbz6S9ToN0P18dgdJPwlITZR3rdrXZ/rfS2QadN/Zdjds2/D
	 icBEmgFUL+clVaDPq546y7vVdbja7RgNE2RLnKvnjDj6IHPtQgWrZrE2BSoNskwMFv
	 ETsNUXGdg/a+XIJpFn0QUOtu6RrsBbVfz1WpQBle7dD09LP2pFaIf21CxqeY/KR6GL
	 daazVynr0D7hQ==
Date: Thu, 09 Apr 2026 18:33:13 +0000
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
Message-ID: <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
In-Reply-To: <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org> <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 0809d2fc0d58a5fb56662dd71162decc07573094
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
> +=09.cc_gdsc =3D &cam_cc_titan_top_gdsc,

So.

You can represent this in one of two ways.

- By making the GDSC a depends of the sensor
   Obviously a PITA to keep doing.

- By making the link from CAMCC to the GDSC
   The question is, is it valid for CAMCC or indeed
   any clock controller to be both a provider and
   a consumer of the same power-domain.

The other question I have is; in this setup you have
does the GDSC you've made a link to switch on/off as
it should ? Have you checked ?

I think you can make the argument both ways.

- The sensor should consume the PD provided by the
   controller - like CAMSS and CCI does.

or

- Lets optimise the representation of the dependencies
   so that the consumers don't need to know about it.

The self-referential nature of the change seems a bit odd to me but, at=20
the same time, I find the over-representation of power dependencies like=20
pointless spinning of wheels too...

---
bod


