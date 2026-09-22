Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DBB4F55AC;
	Tue, 22 Sep 2026 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077498; cv=none; b=FKU8TPwxE0fkUcr2tbW11MMheHlCv9WJ3oq30Srn1slrnBAEM56qeqXNRDT1qqn8AFUQ7EKuyc9uzBTfmOGDQ9aALx/+qoquDSxnK6/eAqIAUEIoqpUX8qzbFV49ONXqy5kdZRRp/3TT5TWDMwiAffeJ5ynF1sJcwxcYnnBeF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077498; c=relaxed/simple;
	bh=O7w5n026IGBCjhsjdIg4jrMN2Kmgt8m27mA8hACD7Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyKmtYOuqe0QE+qmMGfE2j53a1JDEvSB2hWLntiS+nmsbG66Iu6h4UFc5tqbm4NC04PRs0hfXTyZHRK1UreRGvexRuuTSurKXsGcw8FhCjRpZ/u6k6QXepJQPSXZdfWjk5WUDUXdhTVO+4mWg67NpdW+mh+bGEKEI4KAcRV9OMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pVoXrkX5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pVoXrkX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077494;
	bh=O7w5n026IGBCjhsjdIg4jrMN2Kmgt8m27mA8hACD7Zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pVoXrkX56NRRSFTs8mEurIzM1btQPZ7cNHzt9klVHEg5O66otXn3IjvRflk8/NA1h
	 4RZ4o8+gzSd3qYXGbM2fACEjF5MtsxM3Vt6JxrdOl2IJNas6FBFhQMb7WGE7HSgWMu
	 Vu4e7WYxn0uGOL/IHDce+2dYGSeN6AHcz6di7TgOa+WlcYlnUeZDxJhlGjQZ6pwo3/
	 CXXuD5kybZhJf1+MSD83QXnoknHpsqPs6nJSeynQhqjm5DIE+TTXB/QkM5g1zz1Cmx
	 9MdXlhPMhlKSpzxcoRdlwCFjkYuGB0zXHJvfj0KqpToVWdNqieJv3tbVerjf75q3Bn
	 jZxR5N3A6HIEA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29C7E17E0515;
	Tue, 22 Sep 2026 13:44:54 +0200 (CEST)
Message-ID: <cf0d3c85-d337-4d77-bfe2-4ba623bdf31b@collabora.com>
Date: Tue, 22 Sep 2026 13:44:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: mediatek: Add MT8516 fallbacks
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260921232807.3137010-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232807.3137010-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 01:28, Rob Herring (Arm) wrote:
> MT8516 topckgen and apmixedsys nodes use the common syscon fallback
> form. Add the MT8516 compatibles to the branches that allow the
> syscon fallback.
> 
> Fixes: cd9fdd06b0e8 ("dt-bindings: arm: mediatek: topckgen: Convert to DT schema")
> Fixes: 16a146735df3 ("dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

