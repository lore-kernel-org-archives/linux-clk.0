Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538007;
	b=Po+fJ3MkSfgTYmnftaKOOfKPBlDWSrFeOusUsEqLx8YJEpwErOghL0q+/7yTy+qhtbol
	 2w+ssW6pe96tizhkctDdIpAMWH28zUd3TzPcoXDQPaAKEGRNFBTByt6oC+wRGMwsFIIPV
	 wv8/vglA7N/KlCToV5bYviF+7fCtIcbGmOe+qQH7KLoLP2wLPSHqPp19lQP9DEnm+dpV7
	 Ux7FfHiopoECBqX30tPNiwACMSeMKNeP+zz077idPga+0QXawxXSjh+Vz6iW/5Mq6/e2n
	 V8KGHWrfV888JDz19TbLRbrVB4X8GHcUzdNXpP75KOLBIZsoc0BiVYNNCM5+NHHZWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538007;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zEq0v2oKNYWb4P6EHAyM+/7c+KRh4LKSoNP+1xVqrHk=;
	b=De9YnZYO5N597vreyb8h9hVXw6KLhmaA68l5vfGqqdq0kHLjUlUnmEK90CfYmzmzwqEI
	 BieVR1QTwrpHQvsIYzO+kBa5ID8GTtwtni72ajexAKFFu8iaHwSw8nGMZBq+LggtyNml1
	 td1iovPeGjtq+Qh2ovxiu3+R/Q8cechL+mM5HfcvMG2yyuUv8/qmkNre421zUaq2PaMa5
	 ApvzpKSPK6M4hnCr4PxHyliR15eRnFgJRjISr5HAQusrsaDhnDy0SL4ewSHxDRhJSy1uU
	 g6o2R89CD8YLrv4oNjHBOcwfptwkRcn0h184hYldoac4GD1BohVWkeBLIfQgBn88VAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCWvpjlA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697D606A335;
	Tue, 24 Nov 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCWvpjlA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9761F000CA;
	Tue, 24 Nov 2026 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538006;
	bh=zEq0v2oKNYWb4P6EHAyM+/7c+KRh4LKSoNP+1xVqrHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OCWvpjlALgIusraQjBom7IxT4QnG012vZVex48VG6RsRaXrGTIJe4BMmisV34VBEq
	 wreiypBU+LZfsrNMZ+hTsu9r0QVUyVd6P1Dr52fRxWdbliD0p/x6rVns5Tz8TGwcDf
	 Bcc7pppTTuv8Pl9kIywZZ6lMWjgpjrGFTA9xdLvagTEtGWvsBEdN6SzwnjaL/9LO3U
	 ADHJ8XIA3QlL6Q+EcijCCWOpdqIl1W0Z7w6wdpuGBXphcLQ3SQeWfX40RmUL2AD0Z3
	 TMBkqiXyqIy2hf1mChF5koTo0liOK6vPuExdqONQyPsvtqIfW0wC3thOEW9xGf3Fd3
	 OMpuUKV3DjB2g==
From: Brian Masney <masneyb@kernel.org>
To: linusw@kernel.org, Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
Subject: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
Message-Id: <179553795742.327668.17908781831724510646.b4-ty@b4>
Date: Tue, 24 Nov 2026 11:32:37 -0500
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
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=lXih8MstoYXHfUZ87usSbt2rL2rCDOllrk5JMU7mf88=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZ93jnRQQWf7vJPoMh9JN6GbvOT9cFnPNvPn9kfltzn
 9JlLv1zHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE9hLDX6GlDl13xdUzvTYW
 yXpkzjEMY8yarOjkvNSr8gGH4YEfJxn+++UWOu5cm/Nru9mE42w/H91RUZFm2e1e0PaNs3pZTMl
 jTgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 19 Nov 2026 16:14:53 +0800, Wang Haoran wrote:
> clk: versatile-icst: release regmap on registration failure

Applied, thanks!

[1/1] clk: versatile-icst: release regmap on registration failure
      https://git.kernel.org/clk/linux/c/f0e15ebf8965

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

