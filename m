Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752579;
	b=Q7VHemjNO9JjTU4+Pd74l4YWg7xqIH0/P+ByZ7jOFDX5RT59MOwja5djNXzSy+7K+AIf
	 D6K1WpOfxTeoMYpVNqHbzPQ1SstEBqL+GcEbWYk59ZaM3+ruXGtdvrHZdwQaJv2s9aAFy
	 ghADrMlMPFDjceY8DunCEEx+7ThmlrCqz54ShJW4bp5+rbc9VYBDwlJzIV+FSjev4QcxF
	 pJLaAbPPuKfOgu5NPfMG0ykUvee3jwlTBlEcAcSxQ+lJNZIwUb8VFrLOl8KDPonddsoW9
	 Uj/fsN/LcE701ozxH8zDVYlGNFjBTgFWYlVpis/uEo4Cx9+/fHmpiCH6gS+ghfc6BGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752579;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yZTnZuexd9uLwgL3t6Hp0pHWRLfugF4lPNO7U7GDfmE=;
	b=UnF7TW3EpBLE4q5feMTUrjqVsVKqcvjtYe2xkDdGH6p65anacSfIqj1CghPibRlMm3YO
	 9VxTsTc52OtOa5Tb+KYxF8TeUhpHID0FnHsBiH9CiatPDEMLv8B/iOxv0m2xWq4eNE14U
	 NARfRTbS343Gdgyimk9I7QmFsGM8hRPgshsKxLEe/sqyU2Tv1mw9tzJ5/1TtN+UzC3EwM
	 ztZKo1InN+mqQy6WiPgoXYB8Zbz3+Afuo0jpU/etamknrBI+M5EI3tUqJbpEkPloapuH2
	 l2KGlzDaZnulAojCA2A7Ktyq0rILxW6UX5g0/QO4034M6E6wbLd1wpo27VVfa8nTMvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvptYu46;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB6606A31F;
	Sun, 15 Nov 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvptYu46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0301F000C4;
	Sun, 15 Nov 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752578;
	bh=yZTnZuexd9uLwgL3t6Hp0pHWRLfugF4lPNO7U7GDfmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NvptYu463LBlxh0CD+GsSiVXHNRZeU5Z8VexQ1l/VpUFuKoHnLPyyq11bygCEVsBo
	 Vr7IbmtVBa8nOBy5yOvTg6tKRMSr6PIspxDDV1RldjC4gmQKcTr4c2kLZrXV9YCUnB
	 IqTh4U6/WTP1STLWE6lF1wunykWJGMTaLEdvS6v6yCOepjfI59+mfm6T3rUSEGT+6N
	 w173guqfnApUhK0z7okfy6SO6Fow48rQ576GFueP37GKZRLRrdsq0htX6TcYDykLcb
	 X3E7jxhskYPFsE/rbh0/ppm4ZG4WpJRj1NDZOPLDR2MB1tju8cMecWg3O+VzGcWshg
	 wXMZRFivxi8Yw==
Message-ID: <056d5a5c-f573-4269-9530-ebba0c575449@kernel.org>
Date: Sun, 15 Nov 2026 16:22:53 +0200
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
Subject: Re: [PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC
 definitions
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-17-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-17-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> Those were split up per SoC and are not used anymore.
> 
> Acked-by: Rob Herring (Arm)<robh@kernel.org>
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
