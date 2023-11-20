Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pj4PUboT"
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DA1AA;
	Mon, 20 Nov 2023 03:49:21 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FAD46602173;
	Mon, 20 Nov 2023 11:49:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700480960;
	bh=GgeKqX0D81jFxCF2ScljQWJwFqYbf3BhS4xRK7EFl7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pj4PUboTUn0PFKYoW2bVe5T5gpM1R9jE2wFD+r7NmlbnNROPHvdDpg39zZz7uh3/Z
	 m7hae9NFbRLfEFlHEo455s1RIq0QVmmbdT+0Q+CxekLQi9SxGEBngqqWSnUrmfRdvE
	 Dz8MGIo/EhrTXXTZUt0YnvIqWUhovHK7jvOaYWrCj/r0I36uQBn7J2EjIFxqd4QZiH
	 yJ350qVxghZnVt05/JaZq+G8C9pdSlpnaupzZhVWfNIETf5Y+tz10AcHinO96Nrb3M
	 2Ouy3hKXb6wBdX5tFsouBw/PHZh1IzmhlfmxSwANt6rtvORGEs7C1PU8qUm0pm3sdK
	 2jlKnZIv7lCgQ==
Message-ID: <26145766-d6c9-468b-a4ef-78b776fcaed8@collabora.com>
Date: Mon, 20 Nov 2023 12:49:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: arm: mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= <Garmin.Chang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20231120100258.3428-1-yu-chang.lee@mediatek.com>
 <6bc4fa28-a98f-46c7-b315-7366307b5206@linaro.org>
 <77302f50b5c977011ec26be7a04fa3c6c63653c6.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <77302f50b5c977011ec26be7a04fa3c6c63653c6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 20/11/23 11:26, Yu-chang Lee (李禹璋) ha scritto:
> On Mon, 2023-11-20 at 11:09 +0100, Krzysztof Kozlowski wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 20/11/2023 11:02, yu-chang.lee wrote:
>>> For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
>>> hardware differences in power domains, clocks and subsystem counts,
>>> which should be probed from mtk-mmsys driver to populate device by
>>> platform_device_register_data then start its own clock driver.
>>>
>>> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
>>> ---
>>> Change in v4:
>>> - Squashed binding patches
>>> - This patch is based on [1]
>>> [1] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
>>>    -
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20231117054345.15859-1-yu-chang.lee@mediatek.com/
>>>
>>
>> This probably should stay part of previous patchset. Why splitting
>> it?
>>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof
>>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Thank you for your time and effort. I misunderstood that you want me to
> send the binding patches as a independent serie in previous discussion.
> Only until now I squashed them, but the driver patch has already been
> submitted... Should I resend all of these pathes as a serie again?
> 

For this time it's okay, I can pick those separately... but for the next time,
please, yes, the two are related so they should go in one series.

Thanks,
Angelo

> Thanks,
> 
> Best Regards,
> yuchang

