Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393095;
	b=N8fVdnYh9vDB81dMXsGT0FmZ7pldqavFHDjRSSMcyyVFIKLCBVKUD+eabGv2jWZeLmxK
	 WowA+GDOz/7bQNMvlphgspr2Ap1GhB2b+w56dL7FqKowrTKvaonTOdAbd7lpNV5oWOqgB
	 KXC1sTmR14j35oAMqF2VNcLZZx8w/0e2x4a6gPsVa65yrTE3dTq6v4t6Jrvs4/Wq1ZpJg
	 rmJXR5w5/EfCkDVN5lZVqEFfJZerj6ZJeXo5dBb5XVFXiqxSC/MeuOIYxDNntDtFbBKPn
	 Drf00lX5ve1AevVlFjJslFBv1spL34Fdgy72aYu9fURhHGYoroh2d1UpNps1/S1U4VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393095;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J4YiyeMpQnVQKucDulWRDveRXLLKWQOB9HjcaoZQvU8=;
	b=ypy01U8FLO6A/ziChxmnuRsIcmfa+RQRNrYnjZWYR8Dl+IOXGm+F1kTG9we5C1/npmXG
	 fIRSvm2fTqgvSnWk9BhsRL7rGTZmVMoz4s47nGqezSxM4MmCbRZNAlXBjX2DeLGRk4Dv1
	 ALepjWW65KVKTk1c2f83YTpB6qWD3N16pyqkBiRIdrF22Ua1yKQOoB7x+p9+zw1XUUzGz
	 AVTbBUZabDcyNLEfwHoPkv9WZy1pKttoKsqvZqpuXCfVUTAKJfgLa0Ym/Ujr2+YJ3liPb
	 yulEUPViaffCajF++lDyFcPh6YxBVw+Jpk0y/fAUGQwS8TcSnQ2peOYIKlWwz+NI1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E21606A321;
	Wed, 11 Nov 2026 10:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1401:33fc:f5de:ef9d:4afe:312a]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR5bz-001V4j-0N;
	Wed, 11 Nov 2026 11:31:27 +0100
Message-ID: <794488a9-ff30-4864-af9e-f265d58e05f0@phrozen.org>
Date: Wed, 11 Nov 2026 11:31:26 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: en7523: add a reset operation
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com,
 Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261111085650.632025-1-john@phrozen.org>
 <20261111085650.632025-3-john@phrozen.org>
 <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Philipp,

On Wed, 2026-11-11 at 10:49 +0100, Philipp Zabel wrote:
> Is the i2c-mt7621 driver actually used with any reset controller that
> implements .reset but not .assert/.deassert?

No. Its users are MT7621 and MT7628 (clk-mtmips, which implements
assert, deassert and reset) and EN7581/AN7589 (this driver, assert and
deassert only).

> If not, it would be better to let i2c-mt7621 use
> reset_control_assert/deassert() instead of adding .reset ops to all
> reset controller drivers it is used with.

Agreed. I will drop this patch from v2 and change i2c-mt7621 to assert
and deassert the line instead. That patch goes into v2 of my
"i2c: mt7621: add Airoha AN7589 support" series.

> Is having no delay here valid for all possible reset consumers or are
> we implicitly assuming that this will only ever be used for specific
> i2c resets?

Only for the I2C block, which is a further reason to keep the
sequence in the I2C driver.

Thanks,
John
