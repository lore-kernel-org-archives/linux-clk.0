Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EE202F70;
	Thu, 21 May 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368680; cv=none; b=eG72PvLf3G//E2Ub2EDjvAFSlptvQzoAXjpQ8s+vk+O6kQKwd5DDlAoNSgkHMC+sxTn2abyCpMK5ftAsbZ3M3OUl35lHBgauRduWvEsdKOo92yhBRgjPU2v5aSVsxs8EX7pi+NhhH/49j/B17OkLc4GF825rEqUKKJQgZ88LuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368680; c=relaxed/simple;
	bh=tEdqWOdLGoscQom5A9Sv8FsWifnV/7IKAKaBKNZF69A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PVymthm/vTDw/4tmY79MS5GcfxPle3jBkYh8yuhEuiZIqJA3qRKlbaSEgiEv821CdlNsrT0hxRIZOOPLIavFNg+XpKXAgN8G5VHUfYj3urmdDou/nfud+mmbo7xVqAEaql/LQrAZF+Bbpw/UGzES+OGhg3o7QMYO0t3FyJ49nZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARm1rHaG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARm1rHaG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268511F000E9;
	Thu, 21 May 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368679;
	bh=HSu++TYyXNWN7UkuhucPI0krl37s1KlXCzikluLnBvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ARm1rHaGiTpNM4TayhTd4I5+Bp31XH/mna8eZsWVfBcox620aXO4o7Cu4h1yA+Jyr
	 YWvK3rZEvHhxxb8g/87nDRW2Oea+jWEDLQ5k1ml5fvCT3WcKekfrbIckHd89ZTNTUC
	 xNKPSuglSJOMnjo2xpgThehFJD+2QES2FX++/WtPn2UsxzqXGLRXKr8cD4NwkrjPKc
	 Wb7r1aGws5vQ+4yNqeD1TBZzhgF6i0wl5tHBcrt0udEpB/X3FPLyJ2T8F2Oyue4Nkx
	 nd+1w4WLi+fAQMzEndtZrRtiXTe0ZlGPhx09v1dG/8sqO76J0MMuSE0UTkSxJAHwVG
	 r1Hs5UWr3WI7A==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260514-msm8960-wifi-v2-3-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-3-7cbae45dab5e@smankusors.com>
Subject: Re: (subset) [PATCH v2 03/10] mfd: qcom_rpm: add msm8960 QDSS
 clock resource
Message-Id: <177936867589.3586629.11413200027317835778.b4-ty@b4>
Date: Thu, 21 May 2026 14:04:35 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 14 May 2026 21:08:32 +0700, Antony Kurniawan Soemardi wrote:
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.

Applied, thanks!

[03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
        commit: 72c793196d12cb27e192dee77c3ea64c755b7687

--
Lee Jones [李琼斯]

