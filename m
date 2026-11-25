Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613854;
	b=uLXk3SiqW7JWR6RWBFNyw+blTNKp6lEyxJAKV8l1nq64jnPmgRWfv1/tQP380RMiD3o2
	 bOHOOhNIxOz/LaJWW1JF8BZOmpyo7b2jJUkwf2x//HHogVLTX6rfsU638v6wTh6mZ6/bF
	 ldeUaeZzWKL8vk0N79fNOTeA9CMEUZk+kdw3A2p2UxTuW+fCg+1dWuorLRQUHWPRZnzev
	 r7N2z9ofXZX1GB4nvUnX0j2FJSIZreefLIheuimo2WOKUdIwAc06XMIyy30q19RZPTkeK
	 SNyS5Af5+0vKHOxEHuzTVQIMVDkv6tWOE4pk/z/f+6SJQF0MEMnaayg8XmWogfX3uZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613854;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=zSOmY8Gy8e5lYgsKCLO/qRks5rr/DxPaHmfpdFVxrjs=;
	b=BpQL6R7w23BiHo5YCnfa/BZh0r/50lvJKLFTa562lhtzVSiHV6E1toPxVqBmsYz3Gl2n
	 mIMAWNCL1APuXWDUN9tOJfge1ka5cwKuf+zfpmDKcrHpeyEiYxq600fkM4fRSdE91fLkd
	 MtjRXm3U++fWsev84cLQJMGf2BETqIgLRj1axpVZymTKdnxk3veZ5j3jAaaWORusghAvB
	 bC5BnG1G0x+31RGKwAkJJ/g8Oba5IhKGga9XKzI+oSqWkYlydhZBXf6Wd242pMicOyEQy
	 PXYsS+OU+nG54JDbQ1jNOPe2JZs8EYLpAmDz/emAIxW+ux66fh6sjVmZwBURm/mOPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXaUOyPu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101B606A333;
	Wed, 25 Nov 2026 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EXaUOyPu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33B61F000C0;
	Wed, 25 Nov 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613853;
	bh=zSOmY8Gy8e5lYgsKCLO/qRks5rr/DxPaHmfpdFVxrjs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EXaUOyPusUq/AJoUUXm//v0oKLMF+1aMfPX8gIS7gjQOUdIpYjk5+KUKcPcnhB3MY
	 6gTmU16p2Pps8Te4FQ0rN89jd3Y3MkOq4YdFFZz5hHZmlXzP8uMp7hQ0QlBv/v5UrF
	 nrZvwC39sJ88YBj/RKOVCfCexdCtKZg3ZIHcrC3lcarozW64BTRhNrST37M2NAdSCf
	 IVRhcW0eluFFy1pXI0TtkZvM7sU1832mrcQTneg8IUOjMmX0A3e3aL2IHjgcpFBdXl
	 Z5ksKSDE04+rz7OBvAm+ukCV8k8VX3736k4q7b+KJIxUTTJpMz5oN6RaGcyvhwgo8l
	 a9nWjJx7FaM6Q==
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179553246414.44164.14668877546162285849.b4-review@b4>
 <ecbfc73c-2961-4e05-870c-cffae1d4cf60@foss.st.com>
Date: Wed, 25 Nov 2026 14:37:29 +0100
Message-Id: <179561384966.84329.10896464850349756791.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 17:17 +0100, Gabriel FERNANDEZ wrote:
> Hi Krzysztof,
> 
> 
> On 11/24/26 16:01, Krzysztof Kozlowski wrote:
> >> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> >> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> >> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> >> ETR is already CK_BUS_ETR, these names are confusing. They also differ
> >> from the reference manual and from the STM32MP21 binding, which uses
> >> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> >>
> >> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> >> values, and keep the old names as deprecated aliases so that the
> >> existing users are not affected.
> >>
> >> No functional change.
> > That's ABI break, so clearly not true. Users of this ABI - this header -
> > did compile before, now they don't.
> Thanks for the review. Existing users should still compile: the patch keeps
> the three old names as aliases at the end of the header:
> 
> +/* Deprecated identifiers, kept for backward compatibility */
> +#define CK_BUS_STM500        CK_BUS_STM
> +#define CK_SCMI_ETR        CK_SCMI_BUS_ETR
> +#define CK_SCMI_STM500        CK_SCMI_BUS_STM

Did not scroll that far, that's fine.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
