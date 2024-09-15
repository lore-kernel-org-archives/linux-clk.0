Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF13D551;
	Sun, 15 Sep 2024 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428352; cv=none; b=JmtOMyGvhUCfd0QCAOz8HHWyyzqSZ1w49T+HzWFrsR81NP8EAiWfdO9Vk1ZaboVVFko4JGNd/kxllNlMLM9XiIRydqJHF75Let+RDzLAL0t2ZCZX2Lbnr1hBjM/aakjFVXnHWJkZI0xNJ+g1UGN6sNABf8TFS5GH2sFrjs1DwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428352; c=relaxed/simple;
	bh=dsFMrp52owgT+QXsdARrXyzoDdIWrvC9j2u21aCjt/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6JkvBpqPxVelrZ59N8d/cX8ntp81gYUPopw6auIEiJ/xj9+qmruzwn//ok8vprm38qzgJ+oN3JPk+KqAN1p0Tds+HtDuMzA/r62yTkUOth6W60Vkhc1TjEvvOSLu4K1U1rpDgrIFLmVGniEFbFXDkh2uplVzcVB+eYP1/WSO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ixq+9ZfE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ixq+9ZfE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-205909afad3so39763475ad.2;
        Sun, 15 Sep 2024 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726428351; x=1727033151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsFMrp52owgT+QXsdARrXyzoDdIWrvC9j2u21aCjt/E=;
        b=ixq+9ZfE7a8lBazixy8cfGWC3Y0xGA+isuAsqt0wh/p4Rtrt80ry1MhuH0gYHb0kXT
         tmUWyDX9plxuNra9cSie4cTPA83KCFL7mNWveDw1fT4TihzseaLAqN3xGjYkUug2fvwt
         3/j2LyIZ774wJNoMBLE6PWKj05ftd0+SeHyv1/tTErAMg9xdzzsRKC6zUPvGVGLODAki
         uvBkttM6J+HM94hmtRqrT8q67MehzCv0WhAItYlIsv28hsMa4jLIxytwvc6sZ16mupL4
         Ht1iAa3XtTEG67rdCcW58BagxKCsn18VurIGN1ksABm93j37M/SBVebA3MLlsBuUkl62
         mc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726428351; x=1727033151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsFMrp52owgT+QXsdARrXyzoDdIWrvC9j2u21aCjt/E=;
        b=TYYUDQT9T/gbsTViq1kf68RUPG5kg5QHX1CGRDGqQCwKkuJUxIeu8JL/9LkvEi4oV8
         8bHhNqCMAnYJdEkEpIJg9tizjeA7l7LOTb0MRrh1sEdRM2UPmP1Kw0WXzGn4b6RziK8A
         4+p28b8wtuIwxhPeX7UQ2d5Rg98Mp9eTLwxnyq1rGx7eDqugjrqBv6RHmmKNwendLDSG
         3ZXkPReiH9OEuTzmnHuOTEvHnuFIFngBU2UfqMG4qAv1RvQysXpzSGT7O/k2dhXONaUH
         wG4Dx+CMKBQYvmU6EbyO+KNQC5jP7Co0QEbnyKpqaY+FrzbjJrQ7YvBgo3DwoNGgmwws
         qvUw==
X-Forwarded-Encrypted: i=1; AJvYcCVVpqq5fnFz+6MpANExEyLLQlOpgal8p9DfnXTyPcIzldQmclJg8QXvmx+GuOmmXWQADVx6recSseM8@vger.kernel.org, AJvYcCVlAyJ7nUAs+4HtC8z59xOBEFITsNnZaFuyjHqIpusHUw1FayqruWmLiNhICWoaXSA4Fgw+nxL+DOhP@vger.kernel.org, AJvYcCXJ5fk+oDVjJHdTzgULIje8GyE7l/Fhu2YYXntDQF9E9ymq2jbMVkanEfmwM1z1PmlmeLuGPAl82OiAg/Pb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Ov3QJBfIahPzQEWQFEIlDxlyciOSg3lavUUwwJyBXG9Ni+J9
	fZY5Vmpg66ESYQhqNpymPGbO2tqjfx3aXWLSL+3VkQ99Ly+MJPbVNJb2Vo5QJJ8bcffK6uD7KNS
	LTFQciQ5WOitoDOwFPYYQsWb3OHI=
X-Google-Smtp-Source: AGHT+IH+Uh1qYC1xAfKonOLcFVaIB/RFxfFjSDlBJUEqbp07iFMSDQJBm36Rof9f/CiWuchgMutW+DT9FNYBnFttrAk=
X-Received: by 2002:a17:902:d546:b0:205:9112:efea with SMTP id
 d9443c01a7336-2076e39c879mr190881715ad.35.1726428350658; Sun, 15 Sep 2024
 12:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:25:39 +0200
Message-ID: <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, Sep 11, 2024 at 5:09=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic Meson8, Meson8b and Meson8m2 Clock and
> Reset Controller to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Thank you for working on this! First of all this patch is:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Do you want me to send a patch to document the
"amlogic,meson-hhi-sysctrl" compatible string next?
We either have to update
Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.=
yaml
or create a similar binding file for the older SoCs.
Also I think when documenting that compatible string we'll have to add
per-SoC compatibles as I think this generic one is not enough.

Best regards,
Martin
