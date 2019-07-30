Return-Path: <SRS0=6EmA=V3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75652C0650F
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jul 2019 11:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D23E20693
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jul 2019 11:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLGZNtXb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfG3L6N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Jul 2019 07:58:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34515 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfG3L6M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Jul 2019 07:58:12 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so27485183edb.1;
        Tue, 30 Jul 2019 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iOiEct7sDLGxqmV+UPTVkXRXkJ+NL1mETFmJCsflESw=;
        b=tLGZNtXbCFp3mqH0P/RtojF91k9GUpzlWZ54YWSNdlWOq1VyCWPMoEpVEUeryUM1+m
         FaV/pAK9CSKmwlrkDchBo3saRAqAKH0Ba+7qgHAt3ys84gd42y73/y5PcfU1nUDT1QCj
         P0LYqWrQgR/dmDHD/Adh6ja17B6F1vQRx3kHnDexxIuL+lLT2hA9eDJLtP+Hokj0bsVP
         MxqqRdXQQb5AfokymMXITVV+7EMSkrNpMaCxNeC6ag4NXH2waInvfQcent67x8QXunI3
         pTfB5Wd0t2UcnF+SlIQcjR1Bu6ecN7GI1NOSMgFHbIqUIiHSsqCfiiLlisNnM+X+k6Mh
         hTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iOiEct7sDLGxqmV+UPTVkXRXkJ+NL1mETFmJCsflESw=;
        b=UND4FknOmGUN4YwfgFGdUOqG6S9wEZ7rUlQevzZvPDsdGeObaPF+voy1NE9bDbtlS1
         346LuYT2mX0nOPAIYFQUgQKRF4wtWxuth+QAUT/aRlIYwiF05IK4qBQyvwy4NFvgD2hf
         zlqY3WpE1WmvcXGFy2EeJqUhwAssepo09uxt/Xb38+fklIR1kVwBOHvWo3dhvHic3HLj
         30C2ACRKokTl/5Ztg0JOJfiXf9w5o3LKS4m0R8d2Y0LdN85w3KTPan6cd6GPftJ4Ux2z
         5kkPGZZQvSXIWSpwjFPlyJHnzEto7KLYkMwMImYwS7rezfpe9b7qHAdJkDTGyucN31LR
         mf0g==
X-Gm-Message-State: APjAAAUcb/gs+60uR12bH3H0rh2TGst+73s3vNv5MT8fLna91OliHvdc
        d4qFqpWvnuCC6+wqTUK5F8I=
X-Google-Smtp-Source: APXvYqwXt0oyv7/kAzbvdzd0Rvpbd8VKBaS3xGM6Fns+8067a0r4bv+zvz2ApFbhQgJhUVfGYa8VnA==
X-Received: by 2002:a17:906:2510:: with SMTP id i16mr21183595ejb.130.1564487890250;
        Tue, 30 Jul 2019 04:58:10 -0700 (PDT)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id z9sm16788528edd.53.2019.07.30.04.58.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 04:58:09 -0700 (PDT)
Date:   Tue, 30 Jul 2019 13:55:58 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Dong Aisheng <dongas86@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        devicetree <devicetree@vger.kernel.org>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 00/11] clk: imx8: add new clock binding for better pm
 support
Message-ID: <20190730115558.GA29350@optiplex>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <CAA+hA=TkrwzWbJQu7Cc6njdQSP--u=Zf+=FcPg-wCZ=rRXoRuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
        micalg=sha-256; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <CAA+hA=TkrwzWbJQu7Cc6njdQSP--u=Zf+=FcPg-wCZ=rRXoRuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 25/07/19, Dong Aisheng wrote:
> Hi Rob & Stephen & Shawn,
>=20
> Could you help review this patchset?
> We're pretty stuck here for a long time and a lot continued work are bloc=
ked.
> We really need your kind help.

I'am also interested in this work and could offer some testing as soon
my imx8qm based board is booting.

Best regards,

Oliver

--pWyiEgJYm5f9v55/
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIINNwYJKoZIhvcNAQcCoIINKDCCDSQCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggp8MIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24x
EzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMTYwNjE1MDAwMDAwWhcNMjQwNjE1MDAwMDAwWjBd
MQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xv
YmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAtpZok2X9LAHsYqMNVL+Ly6RDkaKar7GD8rVtb9nw6tzPFnvX
GeOEA4X5xh9wjx9sScVpGR5wkTg1fgJIXTlrGESmaqXIdPRd9YQ+Yx9xRIIIPu3Jp/bpbiZB
KYDJSbr/2Xago7sb9nnfSyjTSnucUcIPZVChn6hKneVGBI2DT9yyyD3PmCEJmEzA8Y96qT83
JmVH2GaPSSbCw0C+Zj1s/zqtKUbwE5zh8uuZp4vC019QbaIOb8cGlzgvTqGORwK0gwDYpOO6
QQdg5d03WvIHwTunnJdoLrfvqUg2vOlpqJmqR+nH9lHS+bEstsVJtZieU1Pa+3LzfA/4cT7X
A/pnwwIDAQABo4IBtTCCAbEwDgYDVR0PAQH/BAQDAgEGMGoGA1UdJQRjMGEGCCsGAQUFBwMC
BggrBgEFBQcDBAYIKwYBBQUHAwkGCisGAQQBgjcUAgIGCisGAQQBgjcKAwQGCSsGAQQBgjcV
BgYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMRMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFGlygmIxZ5VEhXeRgMQENkmdewthMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q
+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmds
b2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL3Jvb3QtcjMuY3JsMGcGA1UdIARgMF4wCwYJKwYBBAGgMgEoMAwGCisGAQQB
oDIBKAowQQYJKwYBBAGgMgFfMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNp
Z24uY29tL3JlcG9zaXRvcnkvMA0GCSqGSIb3DQEBCwUAA4IBAQConc0yzHxn4gtQ16VccKNm
4iXv6rS2UzBuhxI3XDPiwihW45O9RZXzWNgVcUzz5IKJFL7+pcxHvesGVII+5r++9eqI9XnE
KCILjHr2DgvjKq5Jmg6bwifybLYbVUoBthnhaFB0WLwSRRhPrt5eGxMw51UmNICi/hSKBKsH
hGFSEaJQALZy4HL0EWduE6ILYAjX6BSXRDtHFeUPddb46f5Hf5rzITGLsn9BIpoOVrgS878O
4JnfUWQi29yBfn75HajifFvPC+uqn+rcVnvrpLgsLOYG/64kWX/FRH8+mhVe+mcSX3xsUpcx
K9q9vLTVtroU/yJUmEC4OcH5dQsbHBqjMIIFjDCCBHSgAwIBAgIMO12UXtvYfwfC8M6yMA0G
CSqGSIb3DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNh
MTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMw
HhcNMTkwNDAxMTExNjI5WhcNMjIwNDAxMTExNjI5WjCBlTELMAkGA1UEBhMCREUxDzANBgNV
BAgTBkJlcmxpbjEPMA0GA1UEBxMGQmVybGluMRwwGgYDVQQKExNLb0NvIENvbm5lY3RvciBH
bWJIMRYwFAYDVQQDEw1PbGl2ZXIgR3JhdXRlMS4wLAYJKoZIhvcNAQkBFh9vbGl2ZXIuZ3Jh
dXRlQGtvY29jb25uZWN0b3IuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
6tEB11ySFgf4wcRECw6gPEo6N4BJEkUlxp4L6byZO5YtXgJ2jdMudJsTWuu8w0Gk+7QklmOJ
1qU4Ma066KQ+YgCxLuO1gX7FEl2zciiumyfEvC2rTIXX6c6bvxvMPvJhDm1eRMf4aj10/bgN
Hxk9iuNdSVlqYLu0h5QMLW8HmA5PfN+QpfAn+CUhcJT0wec7vRh3FEiO38ySru6Od+AqfuJK
dj45wOvTEBj42QvHqVYcnzcmXW2KkM+8cZBYabs1bLhO3WldwaOh8EZNRZvSvioKyCNKGgUU
vFcDy3l/aGpEqr4zc0sGhVMpTPZpd67/wcTZgW4waDcDvT/kdFJN5QIDAQABo4ICETCCAg0w
DgYDVR0PAQH/BAQDAgWgMIGeBggrBgEFBQcBAQSBkTCBjjBNBggrBgEFBQcwAoZBaHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NwZXJzb25hbHNpZ24yc2hhMmczb2Nz
cC5jcnQwPQYIKwYBBQUHMAGGMWh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9nc3BlcnNv
bmFsc2lnbjJzaGEyZzMwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEW
Jmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwRAYD
VR0fBD0wOzA5oDegNYYzaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc3BlcnNvbmFsc2ln
bjJzaGEyZzMuY3JsMFsGA1UdEQRUMFKBH29saXZlci5ncmF1dGVAa29jb2Nvbm5lY3Rvci5j
b22gLwYKKwYBBAGCNxQCA6AhDB9vbGl2ZXIuZ3JhdXRlQGtvY29jb25uZWN0b3IuY29tMB0G
A1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQU3xRHUdawOpr7j3ksQbT5
tYF66RMwHwYDVR0jBBgwFoAUaXKCYjFnlUSFd5GAxAQ2SZ17C2EwDQYJKoZIhvcNAQELBQAD
ggEBAB/DTqBqTFDUriAbT39gkhoa+uFPWO8NID6UrJ9FqXUpgPzIpkGKf/gv1PKCGVblKY4F
ewgiU3e/ZIAQFIAmwIUPwilkjtBDwHDyBbT68AYLjoS85+8V4ELri7q9fW+w5ldBaCnJ6yiv
B2VMe7Nuu2PO4eI921NG2czrvBggVtYInrQNTAGj+f+JU4nua+YsYq8HkC4FiH4tmHEULFvD
CDQOBeeKqJdn7RsAysG7AwOWwVh8S8FmRGu69RwQbl/PyojiV1w6TUPHm45hj11H1qihrL4X
I9GTHjYv6/Cc6cU1fGVdAmbGK6UrH04yJuJja4YwT3WxU53BWrM6dvdFMksxggJ/MIICewIB
ATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDDtdlF7b2H8H
wvDOsjANBglghkgBZQMEAgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0xOTA3MzAxMTU1NThaMC8GCSqGSIb3DQEJBDEiBCAfIM+BNvtnPOzavc3M
Yk3ZCU/IxiHV/BBXaft8DSCM0zB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQCQ
lRf8YUFcJf0j6/ymZzvKImv22QJooX6foroUlBvQk4irYexFici9L9K9pMt2279kZIzSfQbQ
+7dxVNmjTEacRAE5kvN+MSFf+HZDzBZROCqLAUJSo3hyCY6MADMngzPT46zympyTUS0xhHXO
8ulQlDeenYTxNPHg2l/VSqJr1w6PELOnZyGhTgF3njRcqMLDVDyblMPyeR75USWIXEK2k4us
em46E3XS/2mcVJ9oSkonq1OhyKEP0QqGBfHsw8pLU6GYIEkvcZfOuyGLp0cuL3fr9oGrG8iR
6b/pteEXQDL6Y5m/Lysl/AlxWoQ3DuluFaiZff7ZhD2RU8DyA8wx

--pWyiEgJYm5f9v55/--
