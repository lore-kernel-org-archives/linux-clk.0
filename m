Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436331;
	b=1Ai99zo0RgHD+90wAIRpeT5WSq9mS8F4XNTikUgWcJHuC2OhRM2U4wAdYXVP0w94d4gS
	 TDEt4eV1mb4BmIOFkY1TMRIcudSMScMYow1L05KbvZkCqddvUHzy/cp15R8NMJ+QO0JAk
	 4It7w/3SyTOR19dyEwI40TApKR8/X+MH3XPAL6akhgIN+uhFJamWCVQFvH76WvF/2++EK
	 6yBSt632qMuYpeMABpcrtQmDzVnWosN3nFEmRt2qwpATcj/CgCRW+pTQdOFeQPBBzruT/
	 xBl5kEdKiWi5X+zYrlsQJCOnBgtZyeCXcXXydvfuDTtw28z5ToIZDuQMbJP2dTswuGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436331;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+kg3sJyrWiN7gMrxc36gXdNHPipsqqPLkfF8CSj/v4w=;
	b=I7AyzTdp142n1EjVqwLLEGxhGqqRPiQdNvy9LoMbzsX14ch1ZxsybTwmwQzusbPMNICY
	 qxuayq2/G4npvy+Yvzdyl3Opm1EJf8n0CqPoPZKx9wX/JxrMBc5y/+Ys/65cPEyKcQ4bm
	 uzr9PF2cDNhObSi7ya4mwf3pWD+8xal3D+4H2ugv4TG/nxKKctrRKBUOLPomIp1X0t5j1
	 0ADlSxFM923+J9Y3xGTCfMZSGXUCooMySh1iybDWBWuRLUD9pRHcUTMRMePaYTmoOUUmx
	 ZCaHqoxrGwbBviwZjmylKbXompL2sirvehtEow8YQyzDEb376cjsLKk/7yKmjr03WfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyi3cHmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAC606A331;
	Wed, 11 Nov 2026 22:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyi3cHmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E42F1F00A05;
	Wed, 11 Nov 2026 22:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436330;
	bh=+kg3sJyrWiN7gMrxc36gXdNHPipsqqPLkfF8CSj/v4w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Lyi3cHmk9Kb947tH60tQCzm27MFsO9vwBaU8pNf7xbt04XBBM5uL7DqTXu87dN2xM
	 0O7K16NOM7jP+Po60GJv1nK2Lm/0l+ded+PwnwGU52DVa/n/sIDHPXb7IBko4JHh+S
	 h1JsorsEYJCmyZlaWVZzPxqoT38tOG6Dg9KTQCpfJ2v9XVOIm071nJEvH6Md/NKBmy
	 928Ba0Y2aOXHVGjKlJzEW15KqF43jaqErXyWrctHB8PHVyPxbtFbUKnDym5w0dM+CM
	 6ln3zdnrcGK6rD+xVzi4QdHr/kdABru9jB48sF5DzJJHATk7pHhvTL5GcaoPlFxJlQ
	 rdVMJpRJPcWsQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
Date: Wed, 11 Nov 2026 17:32:04 -0500
Message-Id: <179443632478.1143992.14086932638988907034.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=rHnRVNFydzfp9V/ZzkrEl9hj8fg/pgKMijQaqe2JJGg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+vHkm/kj/8Mp8sT8i8z6wnOu8sXixwU7/VVWpf/OWL
 5n41vVlRkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATMTnMyHC3dO21X2/Vr9np
 LJmVevrLxNzc13t2f1ojaxBh5mB98vEqRob2ZxPO7pe/FTGnSWhZloKaMXeo9S/d4k/+30PvtGk
 tjuQGAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Krzysztof,

> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> ETR is already CK_BUS_ETR, these names are confusing. They also differ
> from the reference manual and from the STM32MP21 binding, which uses
> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> 
> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> values, and keep the old names as deprecated aliases so that the
> existing users are not affected.
> 
> No functional change.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

You acked the other dt-binding patches in this series. Can you take a
look at this patch as well?

The other clock patches look good to me.

Brian

-- 
Brian Masney <masneyb@kernel.org>
