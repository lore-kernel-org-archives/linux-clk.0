Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB614A62B
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354315; cv=pass; b=lplvHfL9KXLWpezzbzUFGiJoNoPY1ux7PZzMAWmWqBUFWJg1o0yaCtLttnnfGN6Ul3wNAJJsYVH+lV9mjtOewSBmUr3BHuBAykIJnfN6iRiUrUrbrzgwUWOlTR88X3Qz6u8Q2s/INuEmmG3GxKhUoygLraFLUy9XvAOeM16m+Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354315; c=relaxed/simple;
	bh=mlaZHFNq5XRxueoqRH3q0IdHdk7o8tvxpfjKaHA7LPs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nTxscpfdJTBdy/vKXQKNOdyKGq4he0cqtPUXY7DLNPBVRyp0KwMmgIXs3hgLL4S7T1kobasc0v0WcV26fWDfv6OZXMdysifGytsy1fndIodXfTiwrHafpa0sePPxt+pUOkS44Anon3x4QvOFjHKiyirGOywB/1dndrXlCZZ4+eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPHBkMTS; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPHBkMTS"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b86671f87eso217540eec.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 10:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771354314; cv=none;
        d=google.com; s=arc-20240605;
        b=Hyqjs8SgqYFXf0i6j7lfbHEzc0ua0iK2t677QiXDXcCFmfCIXGCjfu1xgPoB0TvfES
         l7cK1uaNNPrCE+zqJet8sgFcDP+bY9U0AQzQRxc+/7cE8TU4qxOQ4a+b1kzFqZw6CLxf
         BZgkJy56NYdTRxwC9J5RFq9U1iG10a8UxIRf5j0xAXQY0q+4imftbVHMp3RoMTPwXWWC
         t8pduUkyKucC0fVHkfZjNlDoJY3Ds9yLKzziZiRSeyMQLhmlG0pBOHnogIV+XqJWKsRh
         fyP1DecSQQCsEyogO6Z+PGDXmU7wVzS4VIiIxdEbYKgghJ0xiqcJeuBeDmR0+Y+3Uv8l
         jsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        fh=WV0Dq094OivhbgiFGXI78xuosF/B7r6/nM9jIwzf+mg=;
        b=FqDpyLhxGiElcb+GByDgYs9qTafCM4WSL4R9vCedyfHO1vJbMC7s571nsblpe8zNXO
         pkrScYpHLbwWtUibCyILaWBVSa8LGWBB/OEaTHv5quGBS+6p25MHgnCm4gM1Jwm2yVSg
         OU3WtvJofhxg6AHDs/Esn8IMLBBSs3BMhiug3zY9yRTWXSMBDPTirb395geG6ELgWCNT
         RT/aYuRXARJzUKxI8IJev6m9AKRtdLlXbYXy/YkTVyXhkRLBca4sM+72kjCZkO0kNYtB
         zPdbcF5HJmo4YwbO9B4c3ev4efHtsU2Z1GYZjX5clFREiks3uTX6eIq6TIISndrtrl8a
         GyoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354314; x=1771959114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=cPHBkMTSjsQBrLDzh0g8vj7f7bTw03oaXK9dbK4ieBzV5uV+wxGL935i4qZM2/biBM
         QE/Bha4ZjDL/9dUWLpQuPHfI8s3B/peCXQs2sDucRTrCV7+mAgqFgNpf1mp/+CUigEgf
         UxUmiEqc1OykzT5BvYjfQU4Lj3a2+DVZ9KNQXWVDV04oRxtY4l14BdpbfS5fGHcr1zMp
         sDwM2/o7ZYD7ioUiuURlKrQjqR9PaE/cif45Lm8juHfROp9KH+FeCBqpp9CNcLck1BEH
         O3ss3JLl20ZOzvb/o1E116JC8zQGr6T+nVrCn0IdtxigqnVqsLW+30+c3YsKVjTWTC6c
         kNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354314; x=1771959114;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=iQnEd9sdRKGyj7Qr5JCubKFOmPmHC3SJlefKLRQ41dWkBhmCCVhcnOJzvHYH5r+VRv
         entjDYxhk7WbUAHgQvGQVLvLCBBdtVFVNCmsHMaaMGjOcTHBu/792d7hKM4sI4Z6gU5y
         gYUMWt2r81LXOhFKSCGH3K3AQMicWtGX+Bel8Q+VnBECnA/GkZglvkfl24oEMP8rZqWP
         meQ/TZ9bjuRWvxGrciO2hhosZujWD1GOrIiIk+lHras9905G3OPh2riAOExG6AXqlnbL
         +X9Ui4X4u92isATFR72OYqYUWbo8JWT6UXSMuqTSY+utb97+sWYzWY4+CkX6GYJRUiZf
         FeCg==
X-Forwarded-Encrypted: i=1; AJvYcCXrI+rUjApVzIM0BTwdlA9xkB7LvBJNSZEb5IxtX1bd6vqbUMVSx39NBd9hiXBwwD+d9K0nq+QsiLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZj8ynmxOknkwYIQqEIiYiUX8u+yq58rkEoR84vB/VQDNk9QsO
	PeJ9ywYUBuhzZgnR+/dmzME6fqT8K1RlPlcsN27jshBKEqvsWa6jtQO92rMti9yXL6Ck4TRh9mg
	Q2eH4CGts2J0UXx/44Hj8hx2zxcEuQ7E=
X-Gm-Gg: AZuq6aKo1ycQ147aKhe6jSU4eXzggQ7MUkGhTr2UGkaSVfDtJGjKvSQ1UTjbe5HOpac
	MHGEJ01n/zQ6F7N+99249sxgBxv9bXr+1N7lr8S4sEatVqIJCo7rX/rDZuiZOdC819gADEWe5hx
	CYbnjl12Y13YGOXufXnd1R7bIa4MDSsqUvUi9yZBhaAgWOOlW5ghDm9lXggdtZ2wQ/ZTmZjer9+
	LvSD4MvM/Z8DLJnlVfGF6ng10cItCzH4YmloAh3C8tq9JsrzaI8Jk1sphfeoJsfnhHycU2KYPKj
	n+WAu4kz
X-Received: by 2002:a05:7300:b90b:b0:2b8:1d16:9736 with SMTP id
 5a478bee46e88-2babc44ed98mr5624900eec.23.1771354313687; Tue, 17 Feb 2026
 10:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Feb 2026 20:51:42 +0200
X-Gm-Features: AaiRm51oN_WMS2IyaAAXhBJ1VmnFKjk3HIr2OX6Yqqq7pT9MsuQDZGKYwbAC5Us
Message-ID: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: val@packett.cool
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets.
> While here, align comment style with other SoCs.
>
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>

Regards, Yedaya
