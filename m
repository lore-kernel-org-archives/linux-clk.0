Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC081A682F
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 18:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758071; cv=none; b=jLZSMZ0WQQk1CyScGNAX4oVxmG/ZCdKGTE00SU62Bm4AiljR2VUEkmKo0i9kBkJynDGSGbc0xXjYQIIH5QxZWZhy2zeMU33kXB1RtAs99NYZtwsLF5PpQ8UmZWU06+DSha7qgtTUGeZpZSHUpnsBZ2bKUuZa1pwwMLCvTaeAjoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758071; c=relaxed/simple;
	bh=p5k3U6hSJnLNBM7BUwcadVlzQ2VzvGpy63Ep1dyT7jI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKU/DPeFoK+AdpUaATNAZVTXiObUeAiXIHLpEAn82Xv38asUDfiHYMvXe8Hq1PHrOuTqJ8IUp6Ah9oL8wB8txU1VH3DvxYjLhuQ3PR+k5llibyaPbHmz3epuKj14LPf1m55NlGU3L/TsZA7bhU3EGBVI3JLmk9j40xF18D0kOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=lah4rGvv; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="lah4rGvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775758055; x=1776017255;
	bh=p5k3U6hSJnLNBM7BUwcadVlzQ2VzvGpy63Ep1dyT7jI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lah4rGvvWdek1UWLhwrgdeakR9f0HS1pE+rL9nCAD4Jjm7y2fsBkZz6B9Xm8PFDLJ
	 qNuQkoWeDwADU9HwXaPC7JmgvsQGpS12cnc7j42OL09UyBUxmmjjwFLftIToMpiUA5
	 xTLgfsxmX7U+EVWPjFyDljwmIxMq2hW47DL5/j+L1m7+s0mVVZTFQdoCtfTySQH9vA
	 GwGdyhTZ2AO2kNyS2jDdB89w8ZvdRCW+AIauyTxMGyxUQaMzxZU3mzXEryAAnoC95h
	 Ws4un1pNivZX0Zloq6WUYPzukmSdzQEedg+vG5nRz5EFqvQlQ+re99uk4tRhoLRDsG
	 uGlU+gckP0M4w==
Date: Thu, 09 Apr 2026 18:07:25 +0000
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Add option to link clock controller to power domain
Message-ID: <c70dbffe-974c-45f6-8612-978a8279dd83@nxsw.ie>
In-Reply-To: <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org> <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: bf73ea641a7969ddeda8e72163ca8381daab1bde
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
> +=09if (desc->use_rpm && desc->cc_gdsc) {

Why desc->use_rpm at all ?

Your later patch enumerates desc->cc_gdsc so if that pointer is=20
populated you want the rest of this code to run.

And the only cc_gdscs you've enumerated are the ones you want to link.

---
bod

