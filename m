Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BD1A73B;
	Thu,  9 Nov 2023 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BCf56i/2"
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A182269A;
	Thu,  9 Nov 2023 03:43:44 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3C10660747A;
	Thu,  9 Nov 2023 11:43:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699530222;
	bh=DG8lr3XMae8Z37XwliFHKZ7pVaHUuHV+P2yiDaz3Oio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BCf56i/2+y3kfhSgdkJ0WVHPmfgOZYAPl/ndNlg9NVEq2TPiRjIJYnU+skFKe//UO
	 qdn6f3SlBvs29wO7gS9EEMFXGMvyivr+sC2Snr3n5VYoL131ouojvT3kf7scVQBxgf
	 1Wt/7vFk7tUdL/4B6GNUVEGfhDSXCOl0pAHdUaMfTQ1hNuEI/8zfUnM+yMTbpU/Gkb
	 vghdjRYF4N+o6sqCA+LBtkU+aPu8VEolXBLWkoZaAWRsf3jwTckIj66cZYLyGfb4WR
	 A8acdIiyk9oQx/w9kFKVRR29XSxjXx/SAPANomowA1EE5cCbv3ZzQXyfV86HXzEPqn
	 TbtaOnQbplE5Q==
Message-ID: <8ff82531-e2e8-4cdf-833b-ac964c1258c5@collabora.com>
Date: Thu, 9 Nov 2023 12:43:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] dt-bindings: arm:mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
 <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
 <20231109111122.371-4-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109111122.371-4-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/11/23 12:11, yu-chang.lee ha scritto:
> Add VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

P.S.: there's a missing space in the commit title that can be eventually be
fixed while applying.

dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188


