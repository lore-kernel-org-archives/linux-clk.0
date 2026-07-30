Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0E37106D;
	Thu, 30 Jul 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393977; cv=none; b=sSwVoaRAUg8GXaBEno1wqEmRFTcUNtwBS+iwhFwnppj1nWCUQnvNkJ2vk9RZz+kymx8uRm9IoXCe5NbSyU7PgRXGCS2DNzF39Z+HNNt3s2AK/QSDA4UYXe6OveSdu8IqREBR9iMW9y4+rJEdd6As8hYZgAgCwshWLk6sWWlb5Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393977; c=relaxed/simple;
	bh=4CWiWv77dCOM/j+Gj0wbZvj+b7Odxg/tOnFCN7ND37g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKuCCBxYIBgKCx5b3UBFi2OwGuxPQkkHMlD2F0hHuTy6IJEn4jvQ3RSBpcl8QVcOYec90pKmf1Oz8bydNlGnjlH0SDBispcurwmBbv+DKESTRFaxQ3CGK/qF2KIrIORVs/ad+l7+8F2uDFNxRAapZmIqjd9SfnSwPUbj784f1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzyepxpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzyepxpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF641F000E9;
	Thu, 30 Jul 2026 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785393975;
	bh=KHzXdpTUhfUfjebIMdeSyWBJZ/+mDOp1p97e1avEPl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WzyepxpWsUjsHGSh6JvJTyfts+A9pK8otzZrBX8YMyREyr44CU6cRukrZ6lww9Fa9
	 FPgj8Llq8xkC7keoJhykTBo0yFqg8ObvMcOVx1nYhbbLocqvXXxphsXxsNWmz6Zvgu
	 Wtd/poprjc/lyMpzQEHwJUZPoMgZdj/RLZi5uo68v6N54K/YM8so7WO6wHCB6IJhFE
	 AseNhJCVZaOaECyYqqQv+6YFDa3zhCfGwgWrw6xzffB787cuZOUO7/V7FRhMZ5u0ON
	 76K607XwDdvrTQPRfPxYOfhHiLOKxmxIgDZPBtP9D70hVt4JYFDILlSjvXXu9k3jtt
	 Q+muUF9GAimBA==
Date: Thu, 30 Jul 2026 08:46:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pavel =?utf-8?B?TMO2Ymw=?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: si544: add si549 compatible
Message-ID: <20260730-authentic-alluring-chital-5833b2@quoll>
References: <20260729115310.3490589-1-pavel@loebl.cz>
 <20260729115310.3490589-2-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260729115310.3490589-2-pavel@loebl.cz>

On Wed, Jul 29, 2026 at 01:53:09PM +0200, Pavel L=C3=B6bl wrote:
> Adding Si549 compatible, which uses different internal oscillator
> frequency. Like in Si544 case, there are three types ending with
> latters a,b and c. Each with different maximum output frequency.
>=20
> Also fix datasheet links after Silicon Labs acquisition by
> Skyworks Solutions.
>=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>
> ---
>  .../devicetree/bindings/clock/silabs,si544.yaml        | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

