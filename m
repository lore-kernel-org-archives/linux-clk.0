Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FE481FD9;
	Mon, 21 Sep 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988177; cv=none; b=Jc8UzjLW3Q7G6Qea9hQGbpJv7mfwwRZ3wzECjhaLTLDSDZq4/IeRLyzIojdbZgb+aRi+TeRyvgIgeHpqQMtFmjMlXWV9EhHR14wU80NhavFk1X3bDaHDzwRh7+P6lui/aSZWOmFRTDm32CjuLsjkDZU6GT+DP8bpTteqDvxtzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988177; c=relaxed/simple;
	bh=w+cy8zPIKF/xDlzbjSv3pIdL4iqEbDHcpzSasSalz/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVDyg9AEc55qpVDQD+/abQhE+cL/jygIDMIkODootYbsKfL/wVKVSv102JNpisgj8pv4bAXo776Uqb+spyXppzApW78mjB2q+jaDkICDjIttAtfS62pqhwmV2eA0oeBBb3jDzXYLn4GX1mJ05NxAzx+PT1Oxdhb86C99rHMsJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N+x5swDt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N+x5swDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789988173;
	bh=w+cy8zPIKF/xDlzbjSv3pIdL4iqEbDHcpzSasSalz/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+x5swDtZttXcUWxFOnG5jeZ8dMdvuckhnH+McXYPPp73jOIDIxjzMU2hU6li9Veq
	 AiP0eFT5krIR8LWeF71Eam91WUK5t/ZsCqAThISHZmLXp6b5SKbJUff6uqwzyUYd/f
	 0xLWdpYUKV4mQNKUgJd5MyoRijKq3IlPiJPZeSxoKDEXXhRT0W8efqUt7I5UBtuXGw
	 qxWmQZU/X4T4g6q2EhH+oYLvroKGkoK3k7xQayRbfkAhZINz3ht+ovXfXG61C6exwB
	 oNt+Gz7K84JsZG3EADfzQ+0wRu02Bww17eU0umuaeVzMBWGUifRLofUVUDS5YSqtGq
	 UUEax7BLWU3yQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B8F317E03B6;
	Mon, 21 Sep 2026 12:56:13 +0200 (CEST)
Message-ID: <9a060038-3f9a-4df9-9051-3b57787da765@collabora.com>
Date: Mon, 21 Sep 2026 12:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: mediatek: mt7988-apmixed: publish the OF module
 alias
To: Pengpeng Hou <hppiscas@163.com>, sboyd@kernel.org
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sam.shih@mediatek.com, daniel@makrotopia.org
References: <20260920033856.14518-1-hppiscas@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260920033856.14518-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 05:38, Pengpeng Hou wrote:
> COMMON_CLK_MT7988 permits a module build, and the apmixed driver matches
> mediatek,mt7988-apmixedsys through its OF table. The table is not
> exported, so the module does not publish the corresponding autoload
> alias.
> 
> Add MODULE_DEVICE_TABLE() for that existing table.
> 
> The issue was found by our static-analysis tool.
> 
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

