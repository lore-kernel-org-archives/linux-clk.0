Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q1JrFp9m"
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104171A3;
	Thu, 16 Nov 2023 00:51:22 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 136366607341;
	Thu, 16 Nov 2023 08:51:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124680;
	bh=mF6TawZlfHBSvwjAG3Ig1Ejgx6UGLHzZWDq+f9s6OLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1JrFp9m9TBfAexVKvLaL/35tQ02PFB83QlH3OiRqIlRSV9SSYiyEy3AVCIVvG16H
	 8Uvf6P0JwP5OeGGtBdPU3UxTikPHy3Fo9lOcqxO/dGDKvrHG4XMwaqvpGiHydEQOnw
	 LtVmJPjF2+sL2h1XUHipmVDoY0wOd3YWDF+DkLEtHVN7lIskXHqqSUbKVOXNKdcx/w
	 v+SABWatc5kguKg5xB7tOpvw0ceyPy+g2ql47tXgIo0mZHMMcwDbdIcbu/wDxrGKas
	 ux3U3uKuoZM03rmpap6gfji1TVpwTebZlpebzsty33Tg1D62hNKeNISoh6OyfZ31N4
	 D29OMDp5qqB/g==
Message-ID: <648c792f-f29a-46c9-a39d-ddf1dd856bbd@collabora.com>
Date: Thu, 16 Nov 2023 09:51:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: mediatek: Remove compatible
 for MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
 <20231116080129.20617-3-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116080129.20617-3-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/11/23 09:01, yu-chang.lee ha scritto:
> MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

