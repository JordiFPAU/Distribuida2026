# Construida Imagenes PACKER

```
packer init xx.pkr.hcl
packer build xx.pkr.hcl
```

## Editar la red

```
nano /etc/network/interfaces
===>Cambiar la IP y Gateway
```

## Reinciiar la red

```
rc-service networking restart
```

## Configuracion Nomad

```
nano /etc/nomad.d/nomad.hcl
===>Cambiar la IP del servidor
```

## Reinciar Nomad

```
/etc/init.d/nomad restart
```


