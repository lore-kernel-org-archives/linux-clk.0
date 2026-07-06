Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273C3225775;
	Mon,  6 Jul 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349110; cv=none; b=C38/wEIxo5NiKX1VMjlkI5rTET9mg6cnc4fwLRuujiRoCJOKtcRGLMRToj/dMh8E4qNPOvBJY8VoK9uygN+tGhWC7WN+X2iBNzjshi1FfP4sroMEMNscC94txZs5hBJYQlyCzFWupGxTl1wzGHEIU+QjzfotkamQy/IvoWX09Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349110; c=relaxed/simple;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfFogNiTb29OiIo3XOxW15tm0G5iMSroHIz7guQosTavvIlxTeC7T6XFeI5ntHB8rfst3Q82TKmK//e1WknE0gYRe5PUmqHAL5AaN7ZUMRo2C/9uKnhqMzmR7x7nrWvsmt1Fz4Ai2Cy21WQWaTc8ckdx9vY7nDpEHN4Xnyde/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VipuLJ4u; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VipuLJ4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783349097; x=1783608297;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VipuLJ4un5PyrPcU0KPcGiK0xJEfiUV3xhrpBqr6mg8Mps1BbtBjxAM5646uVOKIy
	 SlksiiSCQ4zT91kZrt2NMczhh5luxT2AaTiVzcPgJFBMOQkWgrhjcTPhaVxRzqJAuX
	 iF/4etLGMFunrq4FAQ5Dq13xGej6umdPTOu+JTsxCWybEDAk/+Vl+3gkCr/4gQtmqD
	 MY4lCSXXMGSjQgsHN+hWWv1d7NbqwLMzz0bJw+JnB+eSGjRfgt1aCO0qX9GMDWITnT
	 qC5d5gzcCEqZL+J3mqXcDsGcx2iqvZgwEMJiTm3gWploRJZijlDPERGrnjggRphVZS
	 /tpVlyzwY0cLQ==
Date: Mon, 06 Jul 2026 14:44:51 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
Message-ID: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
In-Reply-To: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me> <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4d9a7c56b233fd2d39549ef51db60aa12ffaa5e3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/23/26 7:36 AM, Konrad Dybcio wrote:
> It seems like 8350/8450 should be using what this driver calls
> v5 tables, with this fixup:
Any updates on this?

Regards,
Esteban

