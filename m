Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5F2D47EF
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421256; cv=pass; b=nq0Q711/tA2S0LQfcmqZWZB6AZEZG+YhFmDYvmG27qlHnHib64jfIlJD48UtUJ41lMFAqSCi0kOk7nI5bva6DosH9/NEvqkBdKjmGuZASnFkjgCL6FDbP7acoVOoxRUCDPPvdfa2eOXu+GloGesw1P+e7bZMhJRwyYhs9/dQ4Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421256; c=relaxed/simple;
	bh=6uKgX+FTM0Qddb34IIko45XF60fCsP88ocn5fLnGK6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+LzeRLKkYrCkhQ0/PQLLDYaaVszL8LjG605zdKe8OzKA8bdby8TbhiuVKbbNXZ3VD20UNc1sPU32ScPyYoqQgkAIBZWnhZfu3Noymu3jU3Fk1UZn3ZUU9OrqGvVM2tPLX8gFbn10S9AjQNcYiqZPsvFwsRDVrJLfKDXLw6JyTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltzkSItT; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltzkSItT"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2baa098ffc6so4550092eec.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 05:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771421254; cv=none;
        d=google.com; s=arc-20240605;
        b=Yz1gh4F+snQU0j6ZRntk0+GhIIsn7jKDwypDNdxV8kd6gkUGhM1gthAMcvSauhf/tr
         76EJuhF44AIOxH6DugjfqjoW8CKuu+sdBAQ2eADgD//TS8cFrtUg25vt47Bm+zQ+cxWk
         YHP6Q+TIt+WNEgm8IBZhjtOmr7WDkIi9uuH+WQ6NpaY0uKOx7VVhGHZycoILGWZbMDZM
         4AZKB7UDPcHsBcUPAuF2PS/O6Ea1lmkJus/jwiiwmviJyu4ZCepQX6OLUdpPXbEVZQde
         2cS4eUvXr29DjWqM2sBNbprqgASf1uD5aSWqmhSVJDGsxKTqvvuXJ5W4sE2tPYajZhcP
         qZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        fh=H1UPxQ9+YoRd3KPd4ISTLLnIuh1hS842YuG5b3LIjp0=;
        b=cR1J+9tBm/6+vJHTxeb65gP+sIzda9Kpmal6iVpUd5YW+9zLYBl8ITIf+QTT5JJB5X
         J2brmmCzzgTwsxolzw+wyHivq2Wc8egkg47rJ+qir8+5JdCTiFdqSwngg577A4TLKCaw
         KG7c5ZayuVQ7HDVqB8xUZcJ35W8rVktfviVtc+buUPgmkmQ1vbgpBmssTvQAj8ihmRVs
         yZ+ilKpI+uM1Rm5zAtbhbE9Pytnwxd6Sqzfq2Ey9Vz/icI6MYhZMXokBcWotfPZwe34/
         dEw8NK35EWJs9YiJolHSY5nBRBS6Xis0dPpS8IBLcglDMFAJqVGaNPtRPArQkrWwEI4W
         avyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421254; x=1772026054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=ltzkSItT7wAmsf0b7r/yLVheQw+py8oHM8yGNywbF3/OKslGCTRxKg40Kv9Ads58AK
         ASTxvguu9gvupJGRlrJ/NJvX3FP8fI4moOab7E1iS4OOamS0MulmrdfniZhyHfTGGJiQ
         AU/00fa60cAg/keg5Jv49AOfQ2tQoLNq6bLv8Jkv0LqCxwnhWiD8dUCiLpKoj+zndtyq
         hcoNp3nWlOmpjS+fhm8Pv1p9sXtI4yJtRG2IFr5uUKSpHAY2tAO4lDTw0nqquu6LTxc7
         PriY1vQqIfHK+bUse/DNGztxuEBogiS/844rGetZwUwXlcMFzA/jrJ3Ntef/hr4xEDFb
         /sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421254; x=1772026054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=ECahQ8L4Nr5fTRZhD5IS2cpx/kfwAlfqt4H4wYFgxTaZM3QPFmTVupuhhclKN5KxYE
         SJKFsBFws/IxVOWSl63oPCTvnmvOEoggRZHQ/BwF9/YUvrivZqU4NI4/aqr71cjyMf/1
         y04WM4pYoiPhw1vPDU+Kqzixu47HFX/0CqAPFyvYq5N5EeJ7yNg61jyZUhJh6uT+z+Hs
         yhusZxsPk6fBhmvk5GbYTovMgTnLcF3ifDJJ41ucIBeu+eQByepe35Cr7E1hCbrBf+LG
         qVvMDVP+WQeT9TeLiaVyzKs68UIM+olynKeTIGVXTSVgxvMm6WN7g5kir6FfdhaWSIui
         murA==
X-Forwarded-Encrypted: i=1; AJvYcCWX22CyFUB2ThJSsxAz4/KYBlHOe3wjA2bpS0KnF0vTRobFa4m93VxotXuJQcXIQCzYBBebA3bQP3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+SkLORUI4mkuE2LfcXyHgrLhUuJylI6UVwiWZmQ2Y1Cc/C5l
	YG+Tug17JWhWtG93s4uV/Mpq6oEkHqp6Kt1GjFptg3RvZ7YZGFjAm/4G0daqlhazcahPZmbuKgG
	yUop1rmP2fHG5M8IFUrij4CVWn4maSAo=
X-Gm-Gg: AZuq6aJ6khuJREJLMHsUmhVcte/rPRyuJJHVdwB2m/53CUdL974VdR+nJzYvChz7Trf
	DA6zAy3MvdFSXrdp8ZtLAwy4Me7y6S2gUNJitBRDXEaSyWype/4WWHsQwcVDjpWxN6i+ch2cQyw
	PpIaDLJJWJwYVPC1PYlLga3qMSvD0eSo2UvPKBdSTnk9/nVdfYU3+/fs7YmQgCqQiw+eGK6y0VL
	t0fDTffMqlxFSS/sAK1y+neYmWylsKVrVY3Yuy22zow0OE2ASYgsVlkn3YIppAMFOZYGvWgcAhO
	F9ppcg==
X-Received: by 2002:a05:7301:d19:b0:2ba:6d87:cf68 with SMTP id
 5a478bee46e88-2baba05b5c2mr8036941eec.16.1771421254003; Wed, 18 Feb 2026
 05:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
 <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
In-Reply-To: <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Feb 2026 15:27:22 +0200
X-Gm-Features: AaiRm506tq3L5Z3tHq7u7PFOBpp3iK-Ike8T0d94DU02cYJ-d0FeBWZ88LSnJGc
Message-ID: <CAHuF_Zr7r-x_ov=PMf7KmKEuApis5+eQamxGkcKSh7Y=onr=gA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: val@packett.cool, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 21:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/02/2026 19:51, Yedaya Katsman wrote:
> > On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> >> Add the missing defines for MDSS resets.
> >> While here, align comment style with other SoCs.
> >>
> >> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> >> Signed-off-by: Val Packett <val@packett.cool>
> >> ---
> >>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>
>
> Thanks for the efforts, but unfortunately you cannot test a header. It
> is not possible. Testing means you try given code on a REAL device and
> you cannot do that for the header or bindings.
>
> Please do not add tags which are not representing actual action.

OK, yeah that makes sense. I will send a tag for the last patch, which
only with it applied actually fixed my issue (although presumably it
depends on some of the previous ones in the series).

> Best regards,
> Krzysztof

Thanks, Yedaya
