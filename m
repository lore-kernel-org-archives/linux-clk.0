Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9C313E2B
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757590785; cv=none; b=luyBNwv6MWWViC0q+krkd2DRYb2UN1e074MfvUy7MIJZtzSnWZoJf8kjsI02fw95+dKIIIPBQDAw3B6bJAoXazfF7ouzfuwKhhNJJ5PgIxCfuH81VGx5RV7j2yE5Zkxqcyuy66un5Bekg6jX+KL0s55No0Gr6Yx+I5t2FMoXdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757590785; c=relaxed/simple;
	bh=8+8i7/gLEt0rUUB/6gOKoYAHQWN5NiQ9tvfzw40eu3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FRAi68r4241EuDeauRxbBOvhN2DlPiqdRWoUhswZ8Kf1QTIQ46pjj7VUCO4HToyKv3NS07HorhypwD3lRb32h4BZtBYARvDx/7BT/3h5xQcvEKqvK1f/iT4n3E/5q9boaxBC7elHDXNGzhPucxywziGsobzT7yfp5sTXMiXUxgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wL9iwYnU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wL9iwYnU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so909194a12.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757590782; x=1758195582; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xWMuhM2RYi+FNrqmYok7gVFHArgnW7224bi1jdFV0c=;
        b=wL9iwYnUHbINvyZQj9gRaXdJuE7wXUoqz10ciDGzQwcj6AXABSv0jcHMP5kWEcV3Yj
         eD00vLCV8cMSwQ7Iud+tOjHLdfV83EGsR8DK6p209dWLX9hqbKQ4Gv9ZsfheNfenLV2T
         EN6Qw8bVPFu2Hgr1T9Bn1aFXkv3jGXR7/CcwXaRF9qX99ciGdv9aJFza1/sAP63s5I31
         B8XAA0dWvGvx9D64as63Z07z/8qJ95gIhrVH8kO/Ss9suun8R8KQ6SCljcNcN9QRl5zv
         3nR93Ce3WZ4vnAz5516c8TuNCAdYokN77tavqMxSgkGhp7VOLdD8iHYmV+EMHBbAtYAR
         GURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590782; x=1758195582;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xWMuhM2RYi+FNrqmYok7gVFHArgnW7224bi1jdFV0c=;
        b=GN8fIsnf74Z/yXWbiJGkLnmM2t2lKL8gFHbxPno2wQ1ZcutFFzbP/Tt4n7upLCUNKw
         rS0PiSkRgFGNVzOwJ5g815fPmjyT6SPtjpuVrQwQTK1oTBdZjEeNbupVrgynC7eFjC7K
         V0LV7zt3DmRjZI2dsJ9N3aZ6+HtcuQs0WZ2MSU48MNjMQXuBCs4ABj9aqs4rM0fK9uvn
         HaMGmrCy8mO4J34PmGC0erEqwpPPKXH1AlnW4KOr7PvyS4+p4vTFgc40lXddOqu6bDbr
         /28PDU+Sqi11PZv2pRJo4TlMZsn5st5VZKB+LaAsKuP5QTYS9fSJgJWZ4/7oiy4M8NSZ
         Nlsw==
X-Forwarded-Encrypted: i=1; AJvYcCWSONAbmJpch7g0x8TH4K1Z+KJuBBDsmlF6frLs+iMC2fZtFK0iWDOulVlktY9wzGz3PRK5nQfwS1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXiw2NTOQGLmwW6StnwtEzogIwy9crhUG42bK16ZOHM7Y55hbX
	RYVQ5CMFjLxe9PJC7b2ir6MWPltjeBfayziGm8L5At59SCBbFlh07kBR9k1hEo/56Zk=
X-Gm-Gg: ASbGncsJH9LH4Gc6DOWKu4GxpEZlmrlVoJ2owgdQNEk8315C/Ah2BJKQiAahcazTsEq
	qM7j8yyNUganPapWydfQi7OyyEWigX8h6Ojbxa8XaQQUfWQvf9fK49tdAF7Ss7MR9vB8GNK13h2
	OcOTp4DVLzTklAEHlkZsE5VIBnaRPrBut/sjRhG5OSElY0xIgk5dtHHAfQc6go7g9orgTTIMa9T
	xGCoNRelD34WsCnvhD7kR8G+2Go46+yefXVAs5yDIHk0jtvhKWzMtI1shf4EA7inth2RyqGau8Z
	cQuuVmNCZvb5YGbGHu+/2UG/3dq23J5anMkw6H5PDhrWngwf0C2j0MyfcOO9450cpG3EZUAoo3n
	t5KT1Vzmf8r4qIilRZ+WpNRcqeaCuiA4zybrFGbUsFeqARGn9eG/gDRsIUbk3fbs/Z1k=
X-Google-Smtp-Source: AGHT+IEZInHp+9rgeAuckIp6cJQfSWvhm8Zsy0W3A3PB01GI/sfd7xFPa4gn9aBZ52W+AAwoj8BOCg==
X-Received: by 2002:a05:6402:1ec8:b0:62a:82e8:e1bd with SMTP id 4fb4d7f45d1cf-62a82e8e395mr11930164a12.32.1757590782260;
        Thu, 11 Sep 2025 04:39:42 -0700 (PDT)
Received: from localhost (i68973E31.versanet.de. [104.151.62.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec3400da2sm1035690a12.42.2025.09.11.04.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 13:39:41 +0200
Message-Id: <DCPXXM9P6F0V.5COAK4KHJHZI@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: "Taniya Das" <quic_tdas@quicinc.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Jagadeesh Kona" <quic_jkona@quicinc.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu Sep 11, 2025 at 3:12 AM CEST, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.

Thanks, I've had something like this in my camera branch for a while,
but since I've had enough other problems with clocks/PDs there or camss
not working fully yet, I haven't bothered to upstream it.

Thanks!

Regards
Luca

>
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for S=
M6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6=
350.c
> index 8aac97d29ce3..6c272f7b0721 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk =3D {
>  	},
>  };
> =20
> +static struct gdsc titan_top_gdsc;
> +
>  static struct gdsc bps_gdsc =3D {
>  	.gdscr =3D 0x6004,
>  	.en_rest_wait_val =3D 0x2,
> @@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc =3D {
>  		.name =3D "bps_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  	.flags =3D VOTABLE,
>  };
> =20
> @@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc =3D {
>  		.name =3D "ipe_0_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  	.flags =3D VOTABLE,
>  };
> =20
> @@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc =3D {
>  		.name =3D "ife_0_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc ife_1_gdsc =3D {
> @@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc =3D {
>  		.name =3D "ife_1_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc ife_2_gdsc =3D {
> @@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc =3D {
>  		.name =3D "ife_2_gdsc",
>  	},
>  	.pwrsts =3D PWRSTS_OFF_ON,
> +	.parent =3D &titan_top_gdsc.pd,
>  };
> =20
>  static struct gdsc titan_top_gdsc =3D {

