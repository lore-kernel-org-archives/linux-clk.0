Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23098387359;
	Fri,  9 Oct 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566816; cv=none; b=KEYQ+Tr6n1oLbagkTYkvOxwpSuldn2YyppcaDxswy6nH25IlC65HUNwNM3/MPhKVAmHQxbKqOJvOxB6Z7BsFHuiJRsOxavXZKV8xuCdxlPzaTJDDyGwcWRPqcwthDzvYQLJ6uJ0Xj8UHfrkBloT23CKw0IpS8125DuLwkxkkfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566816; c=relaxed/simple;
	bh=yIfhk7t0Q0/6czwCKnnwk3YcuXiAY847suPHeymdBZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jI/lsG5IUipyr6OmZeSztJeZxnr/T2tMD7RIS1/zzaNqtl6DEyC2ih4TvTT0+NYo86UDOMz0Ho9JcCoo7+ZhPvX7Zrnt9u05E0R9TqUOhYI75T0w5PmM3QRE5UOmLCTLvwuZFz4RMhkTF9ryJBognbsUazitMw4EjybHegVGido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2DmY2Kd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2DmY2Kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8A91F000FF;
	Fri,  9 Oct 2026 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791566813;
	bh=14RtLDjAzH+Uq1svShyy8jPiYQ2LOU2SIP9yEuSlcl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T2DmY2KdIUbhsYApuAAf+IkpllFAWey1TI0KCmptDcs+is6BYjOoKTq9b6nD9KiEK
	 drAB1yGhGELeGx98Fhq6c02u2RbRQQmwoax8UMNUkL4c7bkqF5uJsg98ibYvb81ZL0
	 plTAo+LJ+u0cIZV2dqcru8lHG76EuShljGVgtpXzvxtH3oHxPM64NO6IrZLMjLzOkz
	 /wswbHyXPpjAm6tY18a+0f3/vZEUTjFbRp87830lpGjftuvtyWEvBfCmseWw91o0UF
	 APSfZ9oMxZCfPQUezVaZEBaSJJmCrlLM6u0YM13e8S9ehuUijhUY2G/ixexU9hsuX/
	 0Ys6k/JOjAJQA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001212051.2227941-1-robh@kernel.org>
References: <20261001212051.2227941-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert HiSilicon clocks to DT
 schema
Message-Id: <179156680410.85870.15108447876910168467.b4-ty@b4>
Date: Fri, 09 Oct 2026 19:26:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=323; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=o8aE+f1r4humesp8sIx5qOiEX33R2HJieHvLZ1vmTGo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJOKt9kZWw9KWYYZMqYvflJgq+i9QlOBfm77TMWLOG+X
 FUUzufdUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETEnzIyfPvN/5oprTHJV0hm
 0mdl0yV/dO+cEG45OuOsCuOV2dZNcYwMq+qEcmON4uc9TBCdtS2pc7qv0pZVU7mLqr6rMvDeXLa
 CBwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 01 Oct 2026 16:20:48 -0500, Rob Herring (Arm) wrote:
> dt-bindings: clock: Convert HiSilicon clocks to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: Convert HiSilicon clocks to DT schema
      commit: 8ebee4049bb55abce37a7a0ff8ad44f4c354da49

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

