Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A075236437
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319613; cv=none; b=Oah75yXdAd+XrGhrmEe1DyZFL8Gfhf4JgvDYwIBNF1qFQsF4oz2LLZheGKVkuxMAfCe5y6z7/+BazotLN3co8X2wnz2C9Pb1D36DowSpuGnH2Jbw4L6U/4u926KtquWVLBFa3AarrDdjhRXtLZuAGMgl4UfNW3acfvd55Vis6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319613; c=relaxed/simple;
	bh=MTVHF6JtG89UxGpXd9e/WJXj9+Ify4vzmnMWGsxyimI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDImL+AxtyjCB/jtEOfzDVSvzGluMACVQZqfuuIqWb9spXuvPD/vfbd6rXnrcJbDYEOU9vIsVqigzCz+lK6TMmdP7QJMho/7KtrGCBimayetzgf5dOwqZv6FxFMu3PKWQZdAgduG1ODoJtRhIwEn3j0tts4IAiNaoxBTc+EuRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Olh9RNf; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Olh9RNf"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8823d5127daso16326266d6.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 00:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764319611; x=1764924411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTVHF6JtG89UxGpXd9e/WJXj9+Ify4vzmnMWGsxyimI=;
        b=2Olh9RNf0vvaVJ/+KICg1Mkr/Jty4kWrXU4YUDjIxnkS7Abhmi8DtrznzDaFUV3f6J
         q1ooYAg4ElKvCE06v6M+hEkUF3XxexJjylZFGUDcdFBp3RMn+jXY2nCxdTcca31b8aEB
         Ck05RhkcsbvojBwIVd2iZEYu+ppRhLv0h0gCFbO+xxnUYqy5HIhcIB2O8HdcfcEgdt+q
         R03e72WSO5lXJQlHTvp0dnFuurMi/JolabFc/jZaelIS7BDXcBaGX+i9OUEgh8oub/Wu
         CyplahXnPGOOWaHzymDv6fvut5HzDx206lPsS6W/urR3AFCEdv46mq0FUbK31cdOkLTT
         V4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319611; x=1764924411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTVHF6JtG89UxGpXd9e/WJXj9+Ify4vzmnMWGsxyimI=;
        b=HirH0GA2GwNSi9D0W/MHrshKxx7Cbc/atYlvQRVZnMIKZR9Vv0K6blB7fGMecDGoMD
         h4jJNrU5/lAfIQttaJvGSTUx+nppwtYp60F2cZsHIRxdJbkWf/vKnAG/+FDN/PsUPNef
         MFQQ1N3R4dEzAAcO6rQxCf+mzKdK4mgL+QIwll5EsNv/Yp/nCCkjFEGsQMXVxOmzfcrA
         f3Icin/654xSeSPUD2iNpCZuK9ArglnhKtnz3934znTB8ftdGIOkrqiyrNCZ2WUfapEC
         CvnzxdjiaKgkv9khhLtxEnGTveHczPMC7KYj+gVwIn113vD5neRwFYZeoL41g0LOuMQH
         1wTw==
X-Forwarded-Encrypted: i=1; AJvYcCWe6ev6gzfyDiBS6HNF8nNkiQ6WgVRfNcLZk0vNFDHv/v6w6NKrC6fAl4QL7SEByytBjjOG5xWThKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3ZzvnH/wMFhp2Gx7pF05yc8Wh1NVsdWDVv5a+AQWlhs5l4+T
	bfmX+00Sko1Y0++oXTRUjAoDhAtOUBzS03/M+lpP0UzfmVB4tURcicHKRkA6A+uJxlp32jCYpxK
	EpHi9uXG+ZfNSorvLpRxEhtohu0cfPSguEFHBKVx1
X-Gm-Gg: ASbGncsaJB0zeRECjObCrHQAcICje2FBYOk8fLRsEgBXujvN5c8t2Y3LqrywwcMkgUi
	R6qpi952JxoIPbt/f1hluBuIK1A/tjeiUlXpzqkVq2mGJ1VlH9bMb+FA5j0BWeDAxUy3PWyvID6
	6T2SWoQeu16A6ltPF/1oHGdy1Yz04M/HdditKLsriR1bzAg9QwN1DE43iL/zIAKz9EnCQ3/a8p1
	HeKPQFSUVBTLQVe7fa2v9frVvcKzEhOJQlabajlBZjExg8ckztFsSX19Qx+sSwaNqgQHA==
X-Google-Smtp-Source: AGHT+IFdyK+URKaYqV8N88JWvLVU/BFqUZOz7rXRTNMTlT3QezphPQQQt3mqgi7yKGtIeCiA40NZUUi3TsW859esAtM=
X-Received: by 2002:a05:6214:c44:b0:72b:37ff:b877 with SMTP id
 6a1803df08f44-8847c5445bamr368170236d6.42.1764319610829; Fri, 28 Nov 2025
 00:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com> <d3340d34175e0a18675d7460576c7fe7a2623e2e.camel@sipsolutions.net>
In-Reply-To: <d3340d34175e0a18675d7460576c7fe7a2623e2e.camel@sipsolutions.net>
From: David Gow <davidgow@google.com>
Date: Fri, 28 Nov 2025 16:46:39 +0800
X-Gm-Features: AWmQ_blc1vIu11VY7knMcDXJKZPBcz7mb0q_WcbQtANNSxWAtXztx3hvXesalQ8
Message-ID: <CABVgOSn7MPrwQBxL6fnP_1H0BctypdZtA7opzoYfFx5ULoAM=A@mail.gmail.com>
Subject: Re: [PATCH] clk: Disable KUNIT_UML_PCI
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b50d3b0644a3ab60"

--000000000000b50d3b0644a3ab60
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Nov 2025 at 15:44, Johannes Berg <johannes@sipsolutions.net> wrote:
>
> >
> > commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
> > causes clk gate test fail. Deselect KUNIT_UML_PCI to avoid the failure.
>
> While probably _true_ that this "caused" it, it also seems a bit
> dishonest to blame it on that without giving any information as to why
> the clk tests trigger some edge case or so?
>
> FTR, the warning only happens when you pass an address to ioread(),
> iowrite() or similar that wasn't obtained from ioremap(). Which ought to
> not be valid, and I'm pretty convinced that a unit test should never
> even end up here.
>
> So no, I don't think this is a valid change, I think the clk unit tests
> that end up doing readl() in the gate code for a non-existing device are
> broken.

Yeah, the correct solution here is definitely to rework the test to not do this.

Unfortunately, I don't think there's a really pleasant way of faking
these in KUnit tests, but a path forward might involve logic_iomem
(possibly with some changes). Otherwise, reworking the test to put
these writes behind a function which can be mocked would be nice.

Ultimately, I don't have a problem with us disabling this in the
meantime for clk tests -- ultimately it's up to clk folks what their
test config is, and having tests which always fail isn't great -- but
it'd be nice to eliminate the cast-a-random-pointer-to-iomem hacks in
tests.

Cheers,
-- David

--000000000000b50d3b0644a3ab60
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAGEC3/wSMy6MPZFqg/DMj8w
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNTEwMTMyMzQ3
NDlaFw0yNjA0MTEyMzQ3NDlaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7T8v6fZyfEDlp38NMe4GOXuodILGOFXh6
iVuecsKchx1gCg5Qebyxm+ndfb6ePkd2zzsBOkBJmYrx4G009e+oyTnynr5KXvucs+wLlgm53QU7
6pYikvqTM2hezoWz48Ve/6Jq/6I/eAzKGhn4E/3zG15ETIeMpPFy/E7/lGqq+HFRCb6s0tl/QWhC
BiR+n2UvmXbVWPSR51aRAifsKqiuraeU5g9bGCcbuvdbiYQf1AzNDilkvA6FfUaOPTzVj3rgMyZb
mnZpzWOV1bfib3tYXd2x4IvUS3xlvrap0g9EiDxJKUhCskOf7dPTjaS/kku768Y6U/sDVH5ptgvP
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgkirOn68YsEI/fJCO5bIYQxjw1tcF
YeE/bU6D0vA8MKcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUx
MTI4MDg0NjUxWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAZtOdV/S1VyvXz9/aK09KPipbEbzrz0HytU0yzGzvAJ3hvOpzPUKkNYSVmdibitTo
2m25e1iHnBi8wFQ+asIUTWSeO+42F3XesQ5jNZf7vsyngPmiCqm9p5pxA9vVCksmjJ8C97BtCvW9
6vYJqV1w4109sUDMo6k1hZ3NyoGVR70CHCuOvivN+xwhd527uE7yuF+4KG425sWMa64i0KofXO3t
d83BC8ojEYyUlPj78wdNwp4aVp6zTGQvO6m2SiEyUbEb305IU8dRLZFTlYaVkBSiJpfPXBPV+Is8
naK6cgwLPP1GCCGNeu4k2ZLwtSLH8V//5etf2yn/ff97tydkSg==
--000000000000b50d3b0644a3ab60--
